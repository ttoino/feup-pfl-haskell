module Main where

main = do
  s <- getLine
  guess s

guess :: String -> IO ()
guess s = helper s 1 ['-' | x <- s]
  where
    helper :: String -> Int -> String -> IO ()
    helper s n gg = do
      putStr "? "
      g <- getChar
      let ggg = zipWith (\x y -> if x == g then g else y) s gg
      putStrLn $ '\n' : ggg
      if filter (== '-') ggg == ""
        then putStrLn $ "You guessed in " ++ show n ++ " tries!"
        else helper s (n + 1) ggg
