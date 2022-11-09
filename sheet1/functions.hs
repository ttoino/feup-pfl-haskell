-- 1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = (a < b + c) && (b < a + c) && (c < a + b)

-- 1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where
    s = (a + b + c) / 2

-- 1.3
metades :: [a] -> ([a], [a])
metades a = (take x a, drop x a)
  where
    x = length a `div` 2

-- 1.4 a)
last' :: [a] -> a
last' a = head (drop (length a - 1) a)

-- 1.4 b)
init' :: [a] -> [a]
init' a = take (length a - 1) a

-- 1.5 a)
binom :: Integer -> Integer -> Integer
binom n k = product [1 .. n] `div` (product [1 .. k] * product [1 .. n - k])

binom' :: Integer -> Integer -> Integer
binom' n k | k < n - k = product [n - k + 1 .. n] `div` product [1 .. k]
binom' n k = product [k + 1 .. n] `div` product [1 .. n - k]

-- 1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((-b + sdelta) / (2 * a), (-b - sdelta) / (2 * a))
  where
    sdelta = sqrt (b * b - 4 * a * c)
