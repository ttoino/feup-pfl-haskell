# Folha 1

## Definição de funções simples

### 1.1

Para que três valores possam ser medidas dos lados de um triângulo deve verificar-se a seguinte condição: qualquer dos valores deve ser inferior à soma dos outros dois.
Complete a definição de uma função que testa esta condição; o resultado deve ser um valor booleano (`True` ou `False`).

```haskell
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = ...
```

### 1.2

Podemos calcular a área $A$ de um triângulo de lados $a$, $b$, $c$ usando a fórmula de Heron:

$$
A = \sqrt{s (s - a) (s - b) (s - c)}
$$

onde $s = (a + b + c) / 2$.
Complete a seguinte definição em Haskell duma função para calcular esta área.

```haskell
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = ...
```

### 1.3

Usando as funçõeslength,take,dropapresentadas na primeira aula,
escreva uma funçãometadesque divide uma lista em duas com metade do
comprimento (aproximadamente). Exemplo:

metades [1,2,3,4,5,6,7,8] == ([1,2,3,4], [5,6,7,8])

Experimente a sua definição no interpretador e investigue o acontece se a lista
tiver comprimento ímpar.

### 1.4

Neste exercício pretende-se que use as funções do prelúdio-padrão de processamento de lista apresentadas na primeira aula: `head`, `tail`, `length`, `take`, `drop` e `reverse`.

1. Mostre que a função `last` (que obtém o último elemento de uma lista) pode ser escrita como composição de algumas das funções acima. Consegue encontrar *duas* definições diferentes?

2. Analogamente, mostre que a função `init` (que remove o último elemento duma lista) pode ser definida usando as funções acima de duas formas diferentes.

### 1.5

Os coeficientes binomiais ${n}\choose{k}$ são os números que aparecem como coeficien tes dos termos $X^k$ na expansão de $(1 + X)^n$; correspondem também ao *número de formas distintas de escolher $k$ objetos entre $n$* (ou, equivalentemente, o número de subconjuntos com $k$ elementos que podemos formar de um conjunto de $n$ elementos).
Neste exercício pretende-se calcular estes coeficientes para quaisquer $n$ e $k$.[^1]

[^1]: Usamos inteiros de precisão arbitrária (Integer) para evitar “overflow” nos produtos.

1. Complete a definição duma função

    ```haskell
    binom :: Integer -> Integer -> Integer
    binom n k = ...
    ```
  
    para calcular o coeficientes binomial de $n$ e $k$ pela seguinte fórmula:

    $$
    {{n}\choose{k}} = \frac{n!}{k! (n - k)!}
    $$

    *Sugestão*: pode exprimir $n!$ como `product [1..n]`.

2. Podemos escrever a fórmula acima para calcular o mesmo resultado mas evitando multiplicações desnecessárias. Por exemplo, podemos calcular ${10}\choose{2}$ sem ter de calcular $10!$ e $8!$:

    $$
    {{10}\choose{2}} = \frac{10!}{2! \times 8!} = \frac{10 \times 9 \times 8!}{2 \times 1 \times 8!} = \frac{10 \times 9}{2} = 45
    $$

    Usando esta simplificação escreva uma definição alternativa `binom’` com o mesmo tipo e que produz os mesmos resultados mas efetuando menos cálculos.

    *Sugestão*: Se $k < n − k$, o numerador reduz-se a ao produto dos números de $n − k + 1$ até $n$ e o denominador a $k!$. No caso em que $k ≥ n − k$, o numerador reduz-se ao produto dos números de $k + 1$ até $n$ e o denominador a $(n − k)!$.

### 1.6

Podemos calcular as raízes de uma equação de 2º grau $aX^2 + bX + c = 0$ pela fórmula resolvente:

$$
X = \frac{-b \plusmn \sqrt{b^2 - 4ac}}{2a}
$$

Defina uma função

```haskell
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ...
```

que calcula as raízes da equação; o resultado deve ser o *par* `(x1, x2)` de raízes.

Sugestões:

1. a função raiz quadrada em Haskell é `sqrt`;
2. pode usar `let` ou `where` para definir nomes de valores auxiliares como o binómio discriminante $b^2 − 4ac$.

## Tipos e classes

### 1.7

Indique tipos admissíveis para os seguintes valores.

1. <code title="[Char] ou String">['a','b','c']</code>

2. <code title="(Char,Char,Char)">('a','b','c')</code>

3. <code title="[(Bool, Char)]">[(False,'0'),(True,'1')]</code>

4. <code title="([Bool],[Char]) ou ([Bool],String)">([False,True],['0','1'])</code>

5. <code title="[[a] -> [a]]">[tail,init,reverse]</code>

6. <code title="[Bool -> Bool]">[id,not]</code>

### 1.8

Indique o tipo mais geral para as seguintes definições; tenha o cuidado de incluir restrições de classes no caso de operações com sobrecarga.

1. <code title="[a] -> a">segundo xs = head (tail xs)</code>

2. <code title="(a, b) -> (b, a)">trocar (x, y) = (y, x)</code>

3. <code title="a -> b -> (a, b)">par x y = (x, y)</code>

4. <code title="Num a => a -> a">dobro x = 2 ∗ x</code>

5. <code title="Fractional a => a -> a">metade x = x / 2</code>

6. <code title="Char -> Bool">minuscula x = x >= 'a' && x <= 'z'</code>

7. <code title="Ord a => a -> a -> a -> Bool">intervalo x a b = x >= a && x <= b</code>

8. <code title="[a] -> Bool">palindromo xs = reverse xs == xs</code>

9. <code title="(a -> a) -> a -> a">twice f x = f (f x)</code>

## Expressões condicionais, guardas e padrões

### 1.9

Escreva duas definições, respetivamente usando expressões condicionais e guardas, da função `classifica :: Int -> String` que faz corresponder uma classificação qualitativa a uma nota de 0 a 20:

$$
\begin{align*}
  ≤ 9 & \quad \text{“reprovado”}               \\
10–12 & \quad \text{“suficiente”}              \\
13–15 & \quad \text{“bom”}                     \\
16–18 & \quad \text{“muito bom”}               \\
19–20 & \quad \text{“muito bom com distinção”} \\
\end{align*}
$$

### 1.10

O *índice de massa corporal* (IMC) é uma medida simples para classificar o peso de adultos.[^2] O IMC de um indivíduo é calculado como o valor do peso (em quilogramas) a dividir pelo quadrado da altura (em metros):

$$
IMC = peso / altura^2
$$

Por exemplo: um indivíduo com 70Kg e 1.70m de altura tem IMC igual a $70 / 1. 70^2 ≈ 24.22$. Classificamos o resultado nos seguinte intervalos:

$$
\begin{align*}
             & IMC & \quad < 18.5 & \quad \text{“baixo peso”} \\
18.5 ≤ \quad & IMC & \quad < 25   & \quad \text{“peso normal”} \\
  25 ≤ \quad & IMC & \quad < 30   & \quad \text{“excesso de peso”} \\
  30 ≤ \quad & IMC &              & \quad \text{“obsesidade”}
\end{align*}
$$

Escreva uma definição da função `classifica :: Float -> Float -> String` que determina a classificação acima; os dois argumentos da função são, respetivamente, o peso em quilogramas e a altura em metros.

[^2]: <https://www.euro.who.int/en/health-topics/disease-prevention/nutrition/a-healthy-lifestyle/body-mass-index-bmi>

### 1.11

Considere duas possíveis definições das funções `max` e `min` do prelúdio-padrão que calculam, respetivamente, o máximo e o mínimo de dois valores:

```haskell
max, min :: Ord a => a -> a -> a
max x y = if x>=y then x else y
min x y = if x<=y then x else y
```

1. Escreva definições deste género para duas funções `max3` e `min3` para calcular, respetivamente, o máximo e o mínimo de três números.

2. Observe que as operação de máximo e mínimo são *associativas*. Por exemplo, para calcular o máximo de três valores podemos determinar o máximo entre dois deles e depois o máximo do resultado com o terceiro. Re-escreva as funções `max3` e `min3` usando esta ideia e as funções de `max` e `min` do prelúdio-padrão.

### 1.12

Escreva uma definição da função lógica ou-exclusivo

```haskell
xor :: Bool -> Bool -> Bool
```

usando múltiplas equações com padrões.

### 1.13

Pretende-se implementar uma função `safetail :: [a] -> [a]` que extende a função `tail` do prelúdio de forma a dar a lista vazia quando o argumento é a lista vazia (em vez de um erro). Escreva três definições diferentes usando condicionais, equações com guardas e padrões.

### 1.14

Escreva duas definições da função `curta :: [a] -> Bool` para testar se uma lista tem zero, um ou dois elementos, usando:

1. a função `length` do prelúdio-padrão;

2. múltiplas equações e padrões.

### 1.15

A mediana de três valores é o valor "no meio" quando os colocamos por ordem crescente. Por exemplo: `mediana 2 3 (-1) == 2`.

1. Escreva uma definição da função `mediana` para determinar a mediana de 3 valores quaisquer. Qual será o seu tipo mais geral? Note que podemos determinar a mediana usando apenas comparações de ordem.

2. Em vez de definir a mediana diretamente usando comparações (que provavelmente terá sido a sua primeira ideia), pode usar o seguinte método: somamos os 3 valores e subtraímos o maior e o menor. Re-defina a função `mediana` desta forma. Qual será agora o tipo mais geral?

### 1.16

Defina uma função

```haskell
converte :: Int -> String
```

para converter um inteiro positivo inferior a 1 milhão para texto em português.\
Alguns exemplos:

```haskell
converte 21 = "vinte e um"
converte 1234 = "mil duzentos e trinta e quatro"
converte 123456 = "cento e vinte e três mil quatrocentos e cinquenta e seis"
```

*Ideia*: Vamos começar por definir funções auxiliares para converter para texto os números inferiores a 100 e 1000.
