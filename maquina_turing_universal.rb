class MTU
  attr_accessor :fita, :estado, :cursor, :estado_leitura, :simbolo_leitura, :estado_destino, :simbolo_escrita,
                :movimento, :transicoes

  def initialize
    @estado = :q1
    @cursor = 0
    @estado = :qi
    @cursor = 0
    @movimento_salvo = :D
  end

  def processar(entrada)
    @fita = '#' + entrada + '_' * entrada.size * 3 + ' ' # fita semi-infinita, virtual
    estado_leitura = ''
    simbolo_leitura = ''
    estado_destino = ''
    simbolo_escrita = ''
    movimento = :D
    transicoes = {}
    @fita_cadeia = []

    while true
      case [@estado, @fita[@cursor]]

      # iniciar máquina em qi e ir para primeiro estado
      in [:qi, '#']
        operar('#', :q0, :D)
      # começa a ler a fita e salva em uma estrutura de memória.
      # neste caso, vamos salvar em uma estrutura do Ruby
      in [:q0, 'f']
        estado_leitura << 'f'
        operar('f', :q1, :D)
      in [:q1, 'a']
        estado_leitura << 'a'
        operar('a', :q1, :D)
      in [:q1, 'b']
        estado_leitura << 'a'
        operar('b', :q1, :D)

      ## Leitura de símbolo de leitura
      in [:q1, '_']
        simbolo_leitura << '_'
        operar('_', :q2, :D)
      in [:q1, 's']
        simbolo_leitura << 's'
        operar('s', :q2, :D)
      in [:q2, 'c']
        simbolo_leitura << 'c'
        operar('c', :q2, :D)

      # leitura de estado de destino
      in [:q2, 'f']
        estado_destino << 'f'
        operar('f', :q5, :D)
      in [:q5, 'a']
        estado_destino << 'a'
        operar('a', :q5, :D)
      in [:q5, 'b']
        estado_destino << 'b'
        operar('b', :q5, :D)

      # leitura de símbolo de escrita
      in [:q5, '_']
        simbolo_escrita << '_'
        operar('_', :q6, :D)
      in [:q5, 's']
        simbolo_escrita << 's'
        operar('s', :q6, :D)
      in [:q6, 'c']
        simbolo_escrita << 'c'
        operar('c', :q6, :D)

      # Leitura de movimento
      in [:q6, 'd']
        movimento = :D
        operar('d', :q8, :D)
      in [:q6, 'e']
        movimento = :E
        operar('e', :q8, :D)

      # reinicia a máquina
      in [:q8, 'f']
        # direta, salva transição
        leitura = [estado_leitura, simbolo_leitura]
        transicoes[leitura] = [simbolo_escrita, estado_destino, movimento]
        puts("Transição lida: (#{estado_leitura},#{simbolo_leitura})->(#{simbolo_escrita},#{estado_destino},#{movimento})")

        estado_leitura = 'f'
        simbolo_leitura = ''
        estado_destino = ''
        simbolo_escrita = ''

        operar('f', :q1, :D)

      ######### leitura dos símbolos de w ##########
      # começa a leitura dos símbolos e processamento de w
      in [:q8, '$']
        # adiciona o último estado
        leitura = [estado_leitura, simbolo_leitura]
        transicoes[leitura] = [simbolo_escrita, estado_destino, movimento]
        puts("Transição lida: (#{estado_leitura},#{simbolo_leitura})->(#{simbolo_escrita},#{estado_destino},#{movimento})")
        puts("==========================================\n\n")

        puts('=========== Leitura dos símbolos: ===========')

        operar('$', :q20, :D)

        simbolo_leitura = ''

      in [:q20, '_']
        simbolo_leitura << '_'
        operar('_', :q21, :D)
      in [:q20, 's']
        simbolo_leitura << 's'
        operar('s', :q21, :D)
      in [:q21, 'c']
        simbolo_leitura << 'c'
        operar('c', :q21, :D)

      in [:q21, 's'] # recomeça a leitura
        @fita_cadeia << simbolo_leitura

        # reinicia a leitura dos símbolos
        simbolo_leitura = 's'
        operar('s', :q21, :D)

      in [:q21, '_'] # recomeça a leitura
        @fita_cadeia << simbolo_leitura

        # reinicia a leitura dos símbolos
        simbolo_leitura = '_'
        operar('_', :q21, :D)

      in [:q21, ' '] # finaliza leitura
        @fita_cadeia << simbolo_leitura

        puts("=========== Fita de símbolos: ===========\n")
        print(@fita_cadeia)

        ######## iniciando a leitura de w
        return submaquina(transicoes)
      else
        puts "(#{estado_leitura},#{simbolo_leitura}) = (#{estado_destino},#{simbolo_escrita},#{movimento})"
        return false
      end
    end
  end

  def submaquina(transicoes)
    # estado inicial da máquina a ser simulada
    estado_mt = 'fa'
    @cursor_leitura = 0

    while true
      simbolo_leitura = @fita_cadeia[@cursor_leitura]

      leitura = [estado_mt, simbolo_leitura]
      puts "(#{estado_mt}, #{simbolo_leitura})"
      resultado = transicoes[leitura]

      if resultado.nil?
        puts "\n=========================================="
        puts 'Finalizando a leitura na máquina principal'
        puts "Estado final da máquina: #{estado_mt}"
        puts "==========================================\n\n"
        return false
      end

      simbolo_escrita = resultado[0]
      estado_destino = resultado[1]
      movimento = resultado[2]
      puts "-> (#{estado_destino},#{simbolo_escrita},#{movimento})"

      estado_mt = estado_destino
      @fita_cadeia[@cursor_leitura] = simbolo_escrita

      if estado_mt.start_with?('fb')
        puts "\n=========================================="
        puts 'Finalizando a leitura na máquina principal'
        puts "Estado final da máquina: #{estado_mt}"
        puts "==========================================\n\n"
        return true

      end

      if movimento == :D
        @cursor_leitura += 1
      else
        @cursor_leitura -= 1
      end
    end
  end

  def operar(escrever, estado, movimento = :D)
    @fita[@cursor] = escrever
    @estado = estado
    if movimento == :D
      @cursor += 1
    else
      @cursor -= 1
    end
  end

  def fita
    @fita_cadeia
  end

  attr_reader :cursor
end
