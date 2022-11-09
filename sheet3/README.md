# Folha 3

## Funções de ordem superior

### 3.1

Mostre como a lista em compreensão `[f x | x <- xs, p x]` se pode escrever como combinação das funções de ordem superior `map` e `filter`.

### 3.2

Usando `foldl`, defina uma função `dec2int :: [Int] -> Int` que converte uma lista de dígitos decimais num inteiro. Exemplo: `dec2int [2, 3, 4, 5] = 2345`.

### 3.3

A função `zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]` do prelúdio-padrão é uma variante de `zip` cujo primeiro argumento é uma função usada para combinar cada par de elementos. Podemos definir `zipWith` usando uma lista em compreensão:

```hs
zipWith f xs ys = [f x y | (x, y) <- zip xs ys]
```

Escreva uma definição recursiva de `zipWith`.

### 3.4

Mostre que pode definir função `isort :: Ord a => [a] -> [a]` para ordenar uma lista pelo método de inserção (ver a Folha 3) usando `foldr` e `insert`.

### 3.5

As funções `foldl1` e `foldr1` do prelúdio-padrão são variantes de `foldl` e `foldr` que só estão definidas para listas com pelo menos um elemento (i.e. não-vazias).
`foldl1` e `foldr1` têm apenas dois argumentos (uma operação de agregação e uma lista) e o seu resultado é dado pelas equações seguintes.

$$
\begin{align*}
foldl1 \; (⊕) \; [x_1, ..., x_n] & = (... (x_1 ⊕ x_2) ...) ⊕ x_n \\
foldr1 \; (⊕) \; [x_1, ..., x_n] & = x_1 ⊕ (... (x_{n − 1} ⊕ x_n) ...)
\end{align*}
$$

1. Mostre que pode definir as funções `maximum`, `minimum :: Ord a => [a] -> a` do prelúdio-padrão (que calculam, respetivamente, o maior e o menor elemento duma lista não-vazia) usando `foldl1` e `foldr1`.

2. Mostre que pode definir `foldl1` e `foldr1` usando `foldl` e `foldr`. Sugestão: utilize as funções `head`, `tail`, `last` e `init`.

### 3.6

A função de ordem superior `until :: (a -> Bool) -> (a -> a) -> a -> a` está definida no prelúdio-padrão; `until p f` é a função que repete sucessivamente a aplicação de `f` ao argumento até que que `p` seja verdade. Usando `until`, escreva uma definição não recursiva da função

```hs
mdc a b = if b == 0 then a else mdc b (a `mod` b)
```

que calcula o máximo divisor comum pelo algoritmo de Euclides.

### 3.7

Sem consultar a especificação do Haskell 98, escreva definições não-recursivas
das seguintes funções do prelúdio-padrão:

1. `(++) :: [a] -> [a] -> [a]`, usando `foldr`;
2. `concat :: [[a]] -> [a]`, usando `foldr`;
3. `reverse :: [a] -> [a]`, usando `foldr`;
4. `reverse :: [a] -> [a]`, usando `foldl`;
5. `elem :: Eq a => a -> [a] -> Bool`, usando `any`.

### 3.8

Pretende-se que resolva este exercício sem usar `words` e `unwords` do prelúdio-padrão (pois `words` = `palavras` e `unwords` = `despalavras`).

1. Escreva uma definição da função `palavras :: String -> [String]` que decompõe uma linha de texto em palavras delimitadas por um ou mais espaços.
Exemplo: `palavras "Abra- ca- drabra!" = ["Abra-", "ca-", "dabra!"]`.

2. Escreva uma definição da função `despalavras :: [String] -> String` que concatena uma lista de palavras juntando um espaço entre cada uma.
Note que `despalavras` não é a função inversa de `palavras`; encontre um contra-exemplo que justifique esta afirmação.

### 3.9

A função do prelúdio `scanl` é uma variante do `foldl` que produz a lista com os valores acumulados:

$$
scanl \; f \; z \; [x_1, x_2, ...] = [z, f \; z \; x_1, f \; (f \; z \; x_1) \;x _2, ...]
$$

Por exemplo:

```hs
scanl (+) 0 [1, 2, 3] = [0, 0 + 1, 0 + 1 + 2, 0 + 1 + 2 + 3] = [0, 1, 3, 6]
```

Em particular, para listas finitas `xs` temos que `last (scanl f z xs) = foldl f z xs`.

Escreva uma definição recursiva de `scanl`; deve usar outro nome para evitar colidir com a definição do prelúdio.
