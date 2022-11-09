# Folha 4

## Árvores de pesquisa

Nos exercícios seguintes considere a definição do tipo de árvores de pesquisa apresentada na aulas teórica:

```haskell
data Arv a = Vazia | No a (Arv a) (Arv a)
```

### 4.1

Escreva uma definição recursiva da função `sumArv :: Num a => Arv a -> a` que soma todos os valores duma árvore binária de números.

### 4.2

Baseado-se na função `listar :: Arv a -> [a]` apresentada na aula teórica, escreva a definição duma função para listar os elementos duma árvore de pesquisa por *ordem decrescente*.

### 4.3

Escreva uma definição da função `nivel :: Int -> Arv a -> [a]` tal que `nivel n arv` é a lista ordenada dos valores da árvore no nível $n$, isto é, a uma altura $n$ (considerando que a raiz tem altura 0).

### 4.4

Experimente usar o interpretador de Haskell para calcular a altura de árvores de pesquisa com $n$ valores.

1. usando o método de partições binárias, e.g. `construir [1..n]`;

2. usando inserções simples, e.g. `foldr inserir Vazia [1..n]`;

Experimente com $n =$ 10, 100 e 1000 e compare a altura obtida com o minorante teórico: uma árvore binária com $n$ nós tem altura $≥ \log_2 n$.

### 4.5

Escreva uma definição da função de ordem superior `mapArv :: (a -> b) -> Arv a -> Arv b` tal que `mapArv f t` aplica uma função $f$ a cada valor duma árvore $t$.

### 4.6

Neste exercício pretende-se implementar uma variante da remoção de um valor duma árvore de pesquisa simples.

1. Baseando-se na função `mais_esq :: Arv a -> a` apresentada na aula teórica, escreva uma definição da função `mais_dir :: Arv a -> a` que obtém o valor mais à direita numa árvore (i.e., o maior valor).

2. Usando a função da alínea anterior, escreva uma definição alternativa da função `remover :: Ord a => a -> Arv a -> Arv a` que use o valor mais à direita da sub-árvore esquerda no caso de um nó com dois descentes não-vazios.

## Programas interativos

### 4.7

Escreva um programa completo que lê linhas de texto da entrada-padrão e imprime cada linha invertida.

### 4.8

Escreva uma função interativa `adivinha :: String -> IO ()` que implemente um jogo de advinha duma palavra secreta dada como argumento pelo utilizador; um outro jogador vai tentar adivinhá-la.

O programa deve mostrar a palavra, substituindo as letras desconhecidas por traços e pedir uma nova letra; todas as ocorrências dessa letra na palavra devem então ser reveladas. O jogo termina quando o jogador adivinha a palavra; o programa deve então imprimir o número de tentativas (ver Figura 1).

<figure>
<pre><code>? a
-a-a-a
? e
Não ocorre
-a-a-a
? b
ba-a-a
? n
banana
Adivinhou em 4 tentativas
</code></pre>
<figcaption align="center">Figura 1: Exemplo de interação do jogo de adivinha.</figcaption>
</figure>

### 4.9

Escreva uma função `elefantes :: Int -> ()` tal que, por exemplo, `elefantes 5`imprime os seguintes versos:

```text
Se 2 elefantes incomodam muita gente,
3 elefantes incomodam muito mais!
Se 3 elefantes incomodam muita gente,
4 elefantes incomodam muito mais!
Se 4 elefantes incomodam muita gente,
5 elefantes incomodam muito mais!
```

Sugestão: utilize a função `show :: Show a => a -> String` para converter um inteiro numa cadeia de caracteres; pode ainda re-utilizar a função `sequence_ :: [a] -> ()` para executar uma lista de ações.

### 4.10

O jogo `Nim` desenrola-se com cinco filas de peças idênticas (representadas por estrelas), cujo estado inicial é o seguinte:

```text
1 : ∗∗∗∗∗
2 : ∗∗∗∗
3 : ∗∗∗
4 : ∗∗
5 : ∗
```

Dois jogadores vão alternadamente retirar uma ou mais estrelas de uma das filas; ganha o jogador que remover a última estrela ou grupo de estrelas.

Implemente este jogo um programa em Haskell que pergunte as jogadas de cada jogador e atualize o tabuleiro. Sugestão: represente estado do jogo como uma lista com o número de estrelas em cada fila; o estado inicial será então `[5, 4, 3, 2, 1]`.

### 4.11

Escreva um programa completo que codifique a entrada-padrão usando a cifra de César de 13 posições (ver <https://en.wikipedia.org/wiki/ROT13> e <http://www.rot13.com>). Exemplo:

```console
$ echo "a maria tinha um cordeirinho" | ./rot
n znevn gvaun hz pbeqrvevaub
```
