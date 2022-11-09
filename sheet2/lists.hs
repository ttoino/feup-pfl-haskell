import Data.Char (chr, isAsciiUpper, isLower, isNumber, isUpper, ord)

-- 2.1
myand :: [Bool] -> Bool
myand [] = True
myand (x : xs) = x && myand xs

myor :: [Bool] -> Bool
myor [] = False
myor (x : xs) = x && myor xs

myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x : xs) = x ++ myconcat xs

myreplicate :: Int -> a -> [a]
myreplicate 0 x = []
myreplicate n x = x : myreplicate (n - 1) x

(!!!) :: [a] -> Int -> a
[] !!! n = error "Empty list"
(x : xs) !!! 0 = x
(x : xs) !!! n = xs !!! (n - 1)

myelem :: Eq a => a -> [a] -> Bool
myelem y [] = False
myelem y (x : xs) = x == y || myelem y xs

-- 2.2
intersperse :: a -> [a] -> [a]
intersperse y [] = []
intersperse y [x] = [x]
intersperse y (x : xs) = x : y : xs

-- 2.3
mdc :: Integer -> Integer -> Integer
mdc a 0 = a
mdc a b = mdc b (a `mod` b)

-- 2.4
insert :: Ord a => a -> [a] -> [a]
insert y [] = [y]
insert y (x : xs)
  | y <= x = y : x : xs
  | otherwise = x : insert y xs

isort :: Ord a => [a] -> [a]
isort [] = []
isort (x : xs) = insert x (isort xs)

-- 2.5
minimum' :: Ord a => [a] -> a
minimum' [] = error "Empty list"
minimum' [x] = x
minimum' (x : xs) = min x (minimum' xs)

delete' :: Eq a => a -> [a] -> [a]
delete' y [] = []
delete' y (x : xs)
  | y == x = xs
  | otherwise = x : delete' y xs

ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort a = x : ssort (delete' x a) where x = minimum' a

-- 2.6
firstHundredSquares = sum [x * x | x <- [1 .. 100]]

-- 2.7
approx :: Int -> Double
approx n = sum [fromIntegral ((-1) ^ i) / fromIntegral (2 * i + 1) | i <- [1 .. n]] * 4

approx' :: Int -> Double
approx' n = sqrt (sum [fromIntegral ((-1) ^ i) / fromIntegral ((i + 1) ^ 2) | i <- [1 .. n]] * 12)

-- 2.8
dotprod :: [Float] -> [Float] -> Float
dotprod x y = sum [a * b | (a, b) <- zip x y]

-- 2.9
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1 .. n - 1], n `mod` x == 0]

-- 2.10
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1 .. n], x == sum (divprop x)]

-- 2.11
pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos n = [(x, y, z) | x <- [1 .. n], y <- [1 .. n], z <- [1 .. n], x ^ 2 + y ^ 2 == z ^ 2]

-- 2.12
primo :: Integer -> Bool
primo n = divprop n == [1]

-- 2.13
mersennes :: [Integer]
mersennes = [2 ^ x - 1 | x <- [1 .. 30], primo (2 ^ x - 1)]

-- 2.14
binom :: Integer -> Integer -> Integer
binom n k | k < n - k = product [n - k + 1 .. n] `div` product [1 .. k]
binom n k = product [k + 1 .. n] `div` product [1 .. n - k]

pascal :: Integer -> [[Integer]]
pascal n = [[binom l k | k <- [0 .. l]] | l <- [0 .. n]]

-- 2.15
cifrar :: Int -> String -> String
cifrar n [] = []
cifrar n (c : s)
  | not (isAsciiUpper c) = error "Invalid character"
  | otherwise = chr ((ord c - ord 'A' + n) `mod` 26 + ord 'A') : cifrar n s

-- 2.16
myconcat' :: [[a]] -> [a]
myconcat' a = [x | l <- a, x <- l]

myreplicate' :: Int -> a -> [a]
myreplicate' n x = [x | _ <- [1 .. n]]

(!!!!) :: [a] -> Int -> a
[] !!!! n = error "Empty list"
a !!!! n = head [x | (x, i) <- zip a [0 .. n], i == n]

-- 2.17
forte :: String -> Bool
forte s = length s >= 8 && any isUpper s && any isLower s && any isNumber s

-- 2.18
mindiv :: Integer -> Integer
mindiv n = head ([x | x <- [2 .. floor (sqrt (fromIntegral n))], n `mod` x == 0] ++ [n])

primo' :: Integer -> Bool
primo' n = n > 1 && mindiv n == n

mersennes' :: [Integer]
mersennes' = [2 ^ x - 1 | x <- [1 .. 30], primo' (2 ^ x - 1)]

-- 2.19
nub :: Eq a => [a] -> [a]
nub [] = []
nub (x : xs) = x : nub [i | i <- xs, i /= x]

-- 2.20
transpose :: [[a]] -> [[a]]
transpose a
  | null a || all null a = []
  | otherwise = map head a : transpose (map tail a)

-- 2.21
algarismos :: Integer -> [Integer]
algarismos 0 = [0]
algarismos n = reverse (algrev n)
  where
    algrev 0 = []
    algrev n = n `mod` 10 : algrev (n `div` 10)

-- 2.22
toBits :: Integer -> [Integer]
toBits 0 = [0]
toBits n = reverse (bitsrev n)
  where
    bitsrev 0 = []
    bitsrev n = n `mod` 2 : bitsrev (n `div` 2)

-- 2.23
fromBits :: [Integer] -> Integer
fromBits a = sum (zipWith (*) (reverse a) (iterate (* 2) 1))

-- 2.24
merge :: Ord a => [a] -> [a] -> [a]
merge a [] = a
merge [] b = b
merge (x : xs) (y : ys)
  | x < y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

msort :: Ord a => [a] -> [a]
msort [] = []
msort [a] = [a]
msort l = merge (msort a) (msort b) where (a, b) = splitAt (length l `div` 2) l
