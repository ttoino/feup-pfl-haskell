module Main where

printBoard :: [Int] -> IO ()
printBoard a =
  sequence_ [putStrLn $ show i ++ " : " ++ ['*' | _ <- [1 .. x]] | (i, x) <- zip [1 ..] a]

turn :: Int -> [Int] -> IO ()
turn i a = do
  printBoard a
  putStrLn $ "Player " ++ show i ++ "'s turn!"
  putStr "Take from line "
  lineS <- getLine
  let line = read lineS
  putStr "Take 2 pieces? "
  twoPieces <- getLine
  let pieces = if twoPieces == "y" then 2 else 1
  let b = [if j == line then max 0 (x - pieces) else x | (j, x) <- zip [1 ..] a]

  if sum b == 0
    then putStrLn $ "Player " ++ show i ++ " wins!"
    else if i == 1 then turn 2 b else turn 1 b

nim :: [Int] -> IO ()
nim = turn 1

main = nim [5, 4, 3, 2, 1]
