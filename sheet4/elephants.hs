module Main where

main = do
  x <- getLine
  elephants $ read x

elephants :: Int -> IO ()
elephants x
  | x < 3 = return ()
  | otherwise = do
      elephants (x - 1)
      putStrLn $ "Se " ++ show (x - 1) ++ " elefantes incomodam muita gente,"
      putStrLn $ show x ++ " elefantes incomodam muito mais!"
