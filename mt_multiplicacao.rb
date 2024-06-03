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
q9 = 'fbbbbbbbbbb'

# símbolo branco
@br = '_'

## elementos do alfabeto
## sigma = {s0, s1, ..., sn }
## sc... scc...
@a = 'sc'
@b = 'scc'
@c = 'sccc'
@d = 'scccc'

## movimentacao do cursor
esq = 'e'
dir = 'd'

# transição d(qi,sm) = (qj,sn,E)
## Máquina de Turing para multiplicacao
# d(q0,a) = (q1,_,D)
# d(q1,a) = (q1,a,D)
# d(q1,b) = (q2,d,D)
# d(q2,b) = (q2,b,D)
# d(q2,c) = (q2,c,D)
# d(q2,_) = (q3,c,E)
# d(q3,c) = (q3,c,E)
# d(q3,c) = (q3,c,E)
# d(q3,b) = (q4,d,D)
# d(q4,c) = (q4,c,D)
# d(q4,d) = (q4,d,D)
# d(q4,_) = (q5,c,E)
# d(q5,c) = (q5,c,E)
# d(q5,d) = (q5,d,E)
# d(q5,b) = (q4,d,D)
# d(q5,_) = (q8,_,D)
# d(q5,a) = (q6,a,D)
# d(q6,d) = (q6,b,D)
# d(q6,c) = (q6,c,D)
# d(q6,_) = (q7,_,E)
# d(q7,c) = (q7,c,E)
# d(q7,b) = (q7,b,E)
# d(q7,a) = (q7,a,E)
# d(q7,_) = (q0,_,D)
# d(q8,d) = (q8,_,D)
# d(q8,c) = (q9,c,D)
@d1 = "#{q0}#{@a}#{q1}#{@br}#{dir}"
@d2 = "#{q1}#{@a}#{q1}#{@a}#{dir}"
@d3 = "#{q1}#{@b}#{q2}#{@d}#{dir}"
@d4 = "#{q2}#{@b}#{q2}#{@b}#{dir}"
@d5 = "#{q2}#{@c}#{q2}#{@c}#{dir}"
@d6 = "#{q2}#{@br}#{q3}#{@c}#{esq}"
@d7 = "#{q3}#{@c}#{q3}#{@c}#{esq}"
@d8 = "#{q3}#{@b}#{q4}#{@d}#{dir}"
@d9 = "#{q4}#{@c}#{q4}#{@c}#{dir}"
@d10 = "#{q4}#{@d}#{q4}#{@d}#{dir}"
@d11 = "#{q4}#{@br}#{q5}#{@c}#{esq}"
@d12 = "#{q5}#{@c}#{q5}#{@c}#{esq}"
@d13 = "#{q5}#{@d}#{q5}#{@d}#{esq}"
@d14 = "#{q5}#{@b}#{q4}#{@d}#{dir}"
@d15 = "#{q5}#{@br}#{q8}#{@br}#{dir}"
@d16 = "#{q5}#{@a}#{q6}#{@a}#{dir}"
@d17 = "#{q6}#{@d}#{q6}#{@b}#{dir}"
@d18 = "#{q6}#{@c}#{q6}#{@c}#{dir}"
@d19 = "#{q6}#{@br}#{q7}#{@br}#{esq}"
@d20 = "#{q7}#{@c}#{q7}#{@c}#{esq}"
@d21 = "#{q7}#{@b}#{q7}#{@b}#{esq}"
@d22 = "#{q7}#{@a}#{q7}#{@a}#{esq}"
@d23 = "#{q7}#{@br}#{q0}#{@br}#{dir}"
@d24 = "#{q8}#{@d}#{q8}#{@br}#{dir}"
@d25 = "#{q8}#{@c}#{q9}#{@c}#{dir}"

def linker
  "#{@d1}#{@d2}#{@d3}#{@d4}#{@d5}#{@d6}#{@d7}#{@d8}#{@d9}#{@d10}#{@d11}#{@d12}#{@d13}#{@d14}#{@d15}#{@d16}#{@d17}#{@d18}#{@d19}#{@d20}#{@d21}#{@d22}#{@d23}#{@d24}#{@d25}"
end

def codificacao_cadeia
  "#{@a}#{@a}#{@b}#{@b}#{@b}"
end
