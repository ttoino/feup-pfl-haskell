import Data.Char (isSpace)
import Data.List (intercalate)

-- 3.1
-- [f x | x <- xs, p x] == map f (filter p xs)

-- 3.2
dec2int :: [Int] -> Int
dec2int = foldl (\x b -> x * 10 + b) 0

-- 3.3
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f [] a = []
zipWith' f a [] = []
zipWith' f (a : as) (b : bs) = f a b : zipWith' f as bs

-- 3.4
insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x : xs)
  | n > x = x : n : xs
  | otherwise = insert n xs

isort :: Ord a => [a] -> [a]
isort = foldr insert []

-- 3.5a)
maximum' :: Ord a => [a] -> a
maximum' = foldr1 max

minimum' :: Ord a => [a] -> a
minimum' = foldr1 min

-- 3.5b)
foldr1' :: (a -> a -> a) -> [a] -> a
foldr1' _ [] = error "empty list"
foldr1' f (x : xs) = foldr f x xs

foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' _ [] = error "empty list"
foldl1' f (x : xs) = foldl f x xs

-- 3.6
mdc :: Integral b => b -> b -> b
mdc a b = fst $ until ((== 0) . snd) (\(a, b) -> (b, a `mod` b)) (a, b)

-- 3.7
(+++) :: [a] -> [a] -> [a]
a +++ b = foldr (:) b a

concat' :: [[a]] -> [a]
concat' = foldr (++) []

reverse' :: [a] -> [a]
reverse' = foldr (\a b -> b ++ [a]) []

reverse'' :: [a] -> [a]
reverse'' = foldl (flip (:)) []

elem' :: Eq a => a -> [a] -> Bool
elem' x = any (== x)

-- 3.8a)
palavras :: String -> [String]
palavras [] = []
palavras s
  | isSpace (head s) = palavras (tail s)
  | otherwise = a : palavras b
  where
    (a, b) = break isSpace s

despalavras :: [String] -> String
despalavras = intercalate " "

-- 3.9
scanl' :: (a -> b -> a) -> a -> [b] -> [a]
scanl' _ z [] = [z]
scanl' f z (x : xs) = z : scanl' f (f z x) xs
