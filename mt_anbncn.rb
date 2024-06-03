## estados não finais
## fa... faa...
q0 = 'fa'
q1 = 'faa'
q2 = 'faaa'
q3 = 'faaaa'
q4 = 'faaaaa'
q5 = 'faaaaaa'
q6 = 'faaaaaaa'
q7 = 'faaaaaaaa'
q8 = 'faaaaaaaaa'

## estados finais
## fb... fbb...
q9 = 'fb'

# símbolo branco
@br = '_'

## elementos do alfabeto
## sigma = {s0, s1, ..., sn }
## sc... scc...
@a = 'sc'
@x = 'scc'
@b = 'sccc'
@y = 'scccc'
@c = 'sccccc'
@z = 'scccccc'

## movimentacao do cursor
esq = 'e'
dir = 'd'

# transição d(qi,sm) = (qj,sn,E)
## Máquina de Turing para multiplicacao
# (q0, a) -> (q1, x, D)
# (q1, a) -> (q1, a, D)
# (q1, b) -> (q2, b, D)
# (q2, b) -> (q2, b, D)
# (q2, c) -> (q3, c, E)
# (q3, b) -> (q3, b, E)
# (q3, a) -> (q3, a, E)
# (q3, x) -> (q0, x, D)
# (q0, b) -> (q4, y, D)
# (q4, b) -> (q4, b, D)
# (q4, c) -> (q5, c, E)
# (q5, b) -> (q5, b, E)
# (q5, a) -> (q5, a, E)
# (q5, y) -> (q0, y, D)
# (q0, c) -> (q6, z, D)
# (q6, c) -> (q6, c, D)
# (q6, _) -> (q7, _, E)
# (q7, c) -> (q7, c, E)
# (q7, b) -> (q7, b, E)
# (q7, a) -> (q7, a, E)
# (q7, z) -> (q0, z, D)
# (q0, _) -> (q9, _, D)

@d1 = "#{q0}#{@a}#{q1}#{@x}#{dir}"
@d2 = "#{q1}#{@a}#{q1}#{@a}#{dir}"
@d3 = "#{q1}#{@b}#{q2}#{@b}#{dir}"
@d4 = "#{q2}#{@b}#{q2}#{@b}#{dir}"
@d5 = "#{q2}#{@c}#{q3}#{@c}#{esq}"
@d6 = "#{q3}#{@b}#{q3}#{@b}#{esq}"
@d7 = "#{q3}#{@a}#{q3}#{@a}#{esq}"
@d8 = "#{q3}#{@x}#{q0}#{@x}#{dir}"
@d9 = "#{q0}#{@b}#{q4}#{@y}#{dir}"
@d10 = "#{q4}#{@b}#{q4}#{@b}#{dir}"
@d11 = "#{q4}#{@c}#{q5}#{@c}#{esq}"
@d12 = "#{q5}#{@b}#{q5}#{@b}#{esq}"
@d13 = "#{q5}#{@a}#{q5}#{@a}#{esq}"
@d14 = "#{q5}#{@y}#{q0}#{@y}#{dir}"
@d15 = "#{q0}#{@c}#{q6}#{@z}#{dir}"
@d16 = "#{q6}#{@c}#{q6}#{@c}#{dir}"
@d17 = "#{q6}#{@br}#{q7}#{@br}#{esq}"
@d18 = "#{q7}#{@c}#{q7}#{@c}#{esq}"
@d19 = "#{q7}#{@b}#{q7}#{@b}#{esq}"
@d20 = "#{q7}#{@a}#{q7}#{@a}#{esq}"
@d21 = "#{q7}#{@z}#{q0}#{@z}#{dir}"
@d22 = "#{q0}#{@br}#{q9}#{@br}#{dir}"

def linker
  "#{@d1}#{@d2}#{@d3}#{@d4}#{@d5}#{@d6}#{@d7}#{@d8}#{@d9}#{@d10}#{@d11}#{@d12}#{@d13}#{@d14}#{@d15}#{@d16}#{@d17}#{@d18}#{@d19}#{@d20}#{@d21}#{@d22}"
end

def codificacao_cadeia
  "#{@a}#{@a}#{@a}#{@b}#{@b}#{@b}#{@c}#{@c}#{@c}"
end
