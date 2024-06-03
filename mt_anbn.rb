## estados não finais
## fa... faa...
q0 = 'fa'
q1 = 'faa'
q2 = 'faaa'
q3 = 'faaaa'
q4 = 'faaaaa'
q5 = 'faaaaaa'
q6 = 'faaaaaaa'

## estados finais
## fb... fbb...
q7 = 'fb'

# símbolo branco
@br = '_'

## elementos do alfabeto
## sigma = {s0, s1, ..., sn }
## sc... scc...
@a = 'sc'
@b = 'scc'
@x = 'sccc'
@y = 'scccc'

## movimentacao do cursor
esq = 'e'
dir = 'd'

# transição d(qi,sm) = (qj,sn,E)
## Máquina de Turing para multiplicacao
# (q0, _) -> (q0, _, D)
# (q0, a) -> (q1, x, D)
# (q1, a) -> (q1, a, D)
# (q1, b) -> (q2, y, D)
# (q2, b) -> (q3, b, E)
# (q2, _) -> (q4, _, E)
# (q3, y) -> (q3, y, E)
# (q3, a) -> (q3, a, E)
# (q3, x) -> (q5, x, D)
# (q5, a) -> (q6, x, D)
# (q6, a) -> (q6, a, D)
# (q6, y) -> (q6, y, D)
# (q6, b) -> (q2, y, D)
# (q4, y) -> (q4, y, E)
# (q4, x) -> (q4, x, E)
@d1 = "#{q0}#{@br}#{q0}#{@br}#{dir}"
@d2 = "#{q0}#{@a}#{q1}#{@x}#{dir}"
@d3 = "#{q1}#{@a}#{q1}#{@a}#{dir}"
@d4 = "#{q1}#{@b}#{q2}#{@y}#{dir}"
@d5 = "#{q2}#{@b}#{q3}#{@b}#{esq}"
@d6 = "#{q2}#{@br}#{q4}#{@br}#{esq}"
@d7 = "#{q3}#{@y}#{q3}#{@y}#{esq}"
@d8 = "#{q3}#{@a}#{q3}#{@a}#{esq}"
@d9 = "#{q3}#{@x}#{q5}#{@x}#{dir}"
@d10 = "#{q5}#{@a}#{q6}#{@x}#{dir}"
@d11 = "#{q6}#{@a}#{q6}#{@a}#{dir}"
@d12 = "#{q6}#{@y}#{q6}#{@y}#{dir}"
@d13 = "#{q6}#{@b}#{q2}#{@y}#{dir}"
@d14 = "#{q4}#{@y}#{q4}#{@y}#{esq}"
@d15 = "#{q4}#{@x}#{q4}#{@x}#{esq}"
@d16 = "#{q4}#{@br}#{q7}#{@br}#{dir}"

def linker
  "#{@d1}#{@d2}#{@d3}#{@d4}#{@d5}#{@d6}#{@d7}#{@d8}#{@d9}#{@d10}#{@d11}#{@d12}#{@d13}#{@d14}#{@d15}#{@d16}"
end

def codificacao_cadeia
  "#{@br}#{@a}#{@a}#{@a}#{@b}#{@b}#{@b}"
end
