module Main where

main = do
  x <- getLine
  putStrLn $ reverse x
  main
