-- 1.9
classifica :: Int -> String
classifica x =
  if x <= 9
    then "reprovado"
    else
      if x <= 12
        then "suficiente"
        else
          if x <= 15
            then "bom"
            else
              if x <= 18
                then "muito bom"
                else "muito bom com distinção"

classifica' :: Int -> String
classifica' x
  | x <= 9 = "reprovado"
  | x <= 12 = "suficiente"
  | x <= 15 = "bom"
  | x <= 18 = "muito bom"
  | otherwise = "muito bom com distinção"

-- 1.10
classifica'' :: Float -> Float -> String
classifica'' peso altura = helper (peso / (altura * altura))
  where
    helper x
      | x < 18.5 = "baixo peso"
      | x < 25 = "peso normal"
      | x < 30 = "excesso de peso"
      | otherwise = "obesidade"

-- 1.11 a)
max3 :: Ord a => a -> a -> a -> a
max3 a b c =
  if a >= b && a >= c
    then a
    else
      if b >= a && b >= c
        then b
        else c

min3 :: Ord a => a -> a -> a -> a
min3 a b c =
  if a <= b && a <= c
    then a
    else
      if b <= a && b <= c
        then b
        else c

-- 1.11 b)
max3' :: Ord a => a -> a -> a -> a
max3' a b c = max (max a b) c

min3' :: Ord a => a -> a -> a -> a
min3' a b c = min (min a b) c

-- 1.12
xor :: Bool -> Bool -> Bool
xor False False = False
xor True True = False
xor True False = True
xor False True = True

xor' :: Bool -> Bool -> Bool
xor' a b = a /= b

-- 1.13
safetail :: [a] -> [a]
safetail x = if null x then [] else tail x

safetail' :: [a] -> [a]
safetail' x
  | null x = []
  | otherwise = tail x

safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' x = tail x

-- 1.14 a)
curta :: [a] -> Bool
curta a = length a < 3

-- 1.14 b)
curta' :: [a] -> Bool
curta' [] = True
curta' [a] = True
curta' [a, b] = True
curta' a = False

-- 1.15 a)
mediana :: Ord a => a -> a -> a -> a
mediana a b c
  | b <= a && a <= c = a
  | c <= a && a <= b = a
  | a <= b && b <= c = b
  | c <= b && b <= a = b
  | otherwise = c

-- 1.15 b)
mediana' :: Real a => a -> a -> a -> a
mediana' a b c = a + b + c - min3 a b c - max3 a b c
