module Main where

import Data.Char (chr, isAlpha, ord, toLower)

rot :: Int -> String -> String
rot i = map (rotChar . toLower)
  where
    rotChar c
      | isAlpha c = chr ((ord c - ord 'a' + i) `mod` 26 + ord 'a')
      | otherwise = c

main = do
  x <- getLine
  putStrLn $ rot 13 x
