# Folha 2

## Listas

### 2.1

Escreva novas definições recursivas de funções equivalentes às do prelúdio de Haskell. Por exemplo: defina uma função `myand` equivalente a `and`, `myor` equivalente a `or`, etc.

1. `and :: [Bool] -> Bool` — testar se todos os valores são `True`;

2. `or :: [Bool] -> Bool` — testar se algum valor é `True`;

3. `concat :: [[a]] -> [a]` — concatenar uma lista de listas;

4. `replicate :: Int -> a -> [a]` — produzir uma lista com $n$ elementos iguais;

5. `(!!) :: [a] -> Int -> a` — selecionar o $n$-ésimo elemento duma lista;

6. `elem :: Eq a => a -> [a] -> Bool` — testar se um valor ocorre numa lista.

### 2.2

Escreva uma definição da função `intersperse :: a -> [a] -> [a]` do módulo `Data.List` que intercala um valor entre os elementos duma lista. Exemplo: `intersperse '-' "banana" = "b-a-n-a-n-a"`.

### 2.3

O algoritmo de Euclides para calcular o máximo divisor comum de dois inteiros $a$, $b$ pode ser expresso de forma recursiva:

$$
mdc(a, b) =
\begin{cases}
a & \text{se } b = 0 \\
mdc(b, a \mod b) & \text{caso contrário}
\end{cases}
$$

Traduza esta definição recursiva para uma função `mdc :: Integer -> Integer -> Integer`.

### 2.4

Ordenação de listas pelo **método de inserção**.

1. Escreva definição recursiva da função `insert :: Ord a => a -> [a] -> [a]` da biblioteca `List` para inserir um elemento numa lista ordenada na posição correta de forma a manter a ordenação. Exemplo: `insert 2 [0, 1, 3, 5] = [0, 1, 2, 3, 5]`.

2. Usando a função `insert`, escreva uma definição também recursiva da função `isort :: Ord a => [a] -> [a]` que implementa *ordenação pelo método de inserção*:

   - a lista vazia já está ordenada;
   - para ordenar uma lista não vazia, recursivamente ordenamos a cauda e inserimos a cabeça na posição correta.

### 2.5

Ordenação de listas pelo **método de seleção**.

1. Escreva definição recursiva da função `minimum :: Ord a => [a] -> a` do prelúdio-padrão que calcula o menor valor duma lista não vazia. Exemplo: `minimum [5, 1, 2, 1, 3] = 1`.

2. Escreva uma definição recursiva da função `delete :: Eq a => a -> [a] -> [a]` da biblioteca `List` que remove a primeira ocorrência dum valor numa lista. Exemplo: `delete 1 [5, 1, 2, 1, 3] = [5, 2, 1, 3]`.

3. Usando as funções anteriores, escreva uma definição recursiva da função `ssort :: Ord a => [a] -> [a]` que implementa *ordenação pelo método de seleção*:

   - a lista vazia já está ordenada;
   - para ordenar uma lista não vazia, colocamos à cabeça o menor elemento $m$ e recursivamente ordenamos a cauda sem o elemento $m$.

### 2.6

Usando uma lista em compreensão, escreva uma expressão para calcular a soma $1^2 + 2^2 + ⋯ + 100^2$ dos quadrados dos inteiros de 1 a 100.

### 2.7

A constante matemática $\pi$ pode ser aproximada usando expansão em *séries* (i.e. somas infinitas), como por exemplo:

$$
\frac{\pi}{4} = 1 - \frac{1}{3} + \frac{1}{5} - ⋯ + \frac{(-1)^n}{2n + 1} + ⋯
$$

1. Escreva uma função `aprox :: Int -> Double` para aproximar $\pi$ somando em $n$ parcelas da série acima (onde $n$ é o argumento da função).

2. A série anterior converge muito lentamente, pelo que são necessários muitos termos para obter uma boa aproximação; escreva uma outra função `aprox'` usando a seguinte expansão para $\pi^2$:

    $$
    \frac{\pi^2}{12} = 1 - \frac{1}{4} + \frac{1}{9} - ⋯ + \frac{(-1)^k}{(k + 1)^2} + ⋯
    $$

    Compare os resultados obtidos somado 10, 100 e 1000 termos com a aproximação `pi` pré-definida no prelúdio-padrão.

### 2.8

Escreva uma função `dotprod :: [Float] -> [Float] -> Float` para calcular o *produto interno* de dois vetores (representados como listas):

$$
dotprod [x_1, ..., x_n] [y_1, ..., y_n] = x_1 \times y_1 + ⋯ + x_n \times y_n = \sum^n_{i=1} x_i \times y_i
$$

Sugestão: utilize a função `zip :: [a] -> [b] -> [(a,b)]` do prelúdio-padrão para "emparelhar" duas listas.

### 2.9

Defina uma função `divprop :: Integer -> [Integer]` usando uma lista em compreensão para calcular a lista de *divisores próprios* de um inteiro positivo (i.e. inferiores ao número dado). Exemplo: `divprop 10 = [1, 2, 5]`.

### 2.10

Um inteiro positivo $n$ diz-se *perfeito* se for igual à soma dos seus divisores (excluindo o próprio $n$). Defina uma função `perfeitos :: Integer -> [Integer]` que calcula a lista de todos os números perfeitos até um limite dado como argumento. *Exemplo*: `perfeitos 500 = [6, 28, 496]`. *Sugestão*: utilize a solução do exercício 2.4.

### 2.11

Um trio $(x,y,z)$ de inteiros positivos diz-se *pitagórico* se $x^2 + y^2 = z^2$. Defina a função `pitagoricos :: Integer -> [(Integer,Integer,Integer)]` que calcule todos os trios pitagóricos cujas componentes não ultrapassem o argumento. Por exemplo: `pitagoricos 10 = [(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)]`.

### 2.12

Defina uma função `primo :: Integer -> Bool` que testa primalidade: $n$ é primo se tem exatamente dois divisores, a saber, 1 e $n$. Sugestão: utilize a função do exercício 2.4 para obter a lista dos divisores próprios.

### 2.13

Um *primo de Mersenne* é um número primo da forma $2^n - 1$. Escreva uma definição de `mersennes :: [Int]` da lista dos primos de Mersenne com $w \le 30$ usando uma expressão em compreensão e a função `primo` do exercício 2.12.

### 2.14

Usando uma função `binom` da folha 1 que calcula coeficientes binomiais, escreva uma definição da função `pascal :: Integer -> [[Integer]]` que calcula o triângulo de Pascal até à linha $n$:

$$
\begin{gather*}
{0}\choose{0} \\
{{1}\choose{0}} \qquad {{1}\choose{1}} \\
\mathinner{
  \kern 1mu \raise 1pt {.}
  \kern 2mu \raise 4pt {.}
  \kern 2mu \raise 7pt {\Rule{0pt}{7pt}{0pt}.}
  \kern 1mu
} \mkern 3.25em \vdots \mkern 3.25em \ddots \\
{{n}\choose{0}} \quad \cdots \quad {{n}\choose{k}} \quad \cdots \quad {{n}\choose{n}} \\
\end{gather*}
$$

### 2.15

A *cifra de César* é um dos métodos mais simples para codificar um texto: cada letra é substituída pela que dista $k$ posições à frente no alfabeto; se ultrapassar a letra Z, volta à letra A. Por exemplo, para $k = 3$, a substituição
efetuada é

```text
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
D E F G H I J K L M N O P Q R S T U V W X Y Z A B C
```

e o texto "ATAQUE DE MADRUGADA" é transformado em "DWDTXH GH PDGUXJDGD".

Escreva uma função `cifrar :: Int -> String -> String` para cifrar uma cadeia de caracteres usando um deslocamento dado. Note que `cifrar(−n)` é a função inversa de `cifrar n`, pelo que a mesma função pode servir para codificar e descodificar.

### 2.16

Mostre que as funções do prelúdio-padrão `concat`, `replicate` e `(!!)` podem também ser definidas sem recursão usando listas em compreensão.

### 2.17

Defina uma função `forte :: String -> Bool` para verificar se uma palavra-passe dada numa cadeia de carateres é forte segundo os seguintes critérios: deve ter 8 carateres ou mais e pelo menos uma letra maiúscula, uma letra minúscula e um algarismo.

*Sugestão*: use a função `or :: [Bool] -> Bool` e listas em compreensão.

### 2.18

Neste exercício pretende-se implementar um teste de primalidade mais
eficiente do que o do exercício 2.7.

1. Escreva uma função `mindiv :: Int -> Int` cujo resultado é o menor divisor próprio do argumento (i.e. o menor divisor superior a 1). Note que se $n = p \times q$, então $p$ e $q$ são ambos divisores de $n$; se $p \ge \sqrt{n}$, então $q \le \sqrt{n}$ pelo que o menor divisor será sempre $\le \sqrt{n}$. Assim *não necessitamos de tentar candidatos a divisores superiores à $\sqrt{n}$*.

2. Utilize `mindiv` para definir um teste de primalidade mais eficiente do que o exercício 2.7: $n$ é primo se $n > 1$ e o seu menor divisor próprio for igual a $n$.

### 2.19

A função `nub :: Eq a => [a] -> [a]` do módulo `Data.List` elimina ocorrências de elementos repetidos numa lista ("nub" em inglês significa *essência*). Por exemplo: `nub "banana" = "ban"`.

Escreva uma definição recursiva para esta função. *Sugestão*: use uma lista em compreensão com uma guarda para eliminar elementos duma lista.

### 2.20

Escreva uma definição da função `transpose :: [[a]] -> [[a]]` do módulo `Data.List` para obter a *transposta* de uma matriz (isto é, a matriz simétrica em relação à diagonal principal); a matriz dada e o resultante são representadas como listas de linhas. Exemplo: `transpose [[1, 2, 3], [4, 5, 6]] = [[1, 4], [2, 5], [3, 6]]`.

### 2.21

Escreva uma definição da função `algarismos :: Int -> [Int]` que obtém os algarismos decimais de um inteiro positivo. Exemplo: `algarismos 12345 = [1, 2, 3, 4, 5]`.

*Sugestão*: Pode obter o algarismo das unidades usando o resto da divisão por 10 e prosseguir recursivamente com o quociente da divisão. Comece por definir uma função auxiliar que obtém os algarismos pela ordem inversa, i.e. `algarismosRev 12345 = [5, 4, 3, 2, 1]`.

### 2.22

Escreva uma definição da função `toBits :: Int -> [Int]` que obtém a representação em binário de um inteiro não-negativo. Exemplo: `toBits 29 = [1, 1, 1, 0, 1]`. Note que os dígitos binários do resultado estão pela ordem do mais significativo para o menos significativo.

*Sugestão*: O problema é semelhante ao exercício anterior, mas efetuando divisões por 2 em vez de 10.

### 2.23

Escreva uma definição função da função `fromBits :: [Int] -> Int` que faz a transformação inversa da anterior, ou seja, converte dígitos em binário para o inteiro não-negativo correspondente.

### 2.24

Ordenação de listas pelo método **merge sort**.

1. Escreva uma definição recursiva da função `merge :: Ord a => [a] -> [a] -> [a]` para juntar duas listas ordenadas numa só mantendo a ordenação. Exemplo: `merge [3, 5, 7] [1, 2, 4, 6] = [1, 2, 3, 4, 5, 6, 7]`.

2. Usando a função `merge`, escreva uma definição recursiva da função `msort :: Ord a => [a] -> [a]` que implementa o método *merge sort*:

   - uma lista vazia ou com um só elemento já está ordenada;
   - para ordenar uma lista com dois ou mais elementos, partimos em duas metades, recursivamente ordenamos as duas parte e juntamos os resultados usando `merge`.

    *Sugestão*: comece por definir uma função `metades :: [a] -> ([a],[a])` para partir uma lista em duas metades (ver a Folha 1).

<!-- ### 2.23

Podemos fazer operações com polinómios representados pelas listas de coeficientes. Por exemplo, podemos representar dois polinómios $P = 1 + 3x − x^2$ e $Q = 3 + 2x^2$ pelas listas `[1, 3, −1]` e `[3, 0, 2]`, respetivamente.

1. Escreva uma definição da função `addPoly :: [Int] -> [Int] -> [Int]` que calcula a soma de dois polinómios. Exemplo: `addPoly [1, 3, −1] [3, 0, 2] = [4, 3, 1]` é a lista dos coeficientes de $P + Q$.

2. Escreva uma definição da função `multPoly :: [Int] -> [Int] -> [Int]` que calcula o produto de dois polinómios. Exemplo: `multPoly [1, 3, −1] [3, 0, 2] = [3, 9, −1, 6, −2]` é a lista de coeficientes de $P \times Q$. -->
