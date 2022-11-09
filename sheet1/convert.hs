-- 1.16
convert :: Int -> String
convert x
  | x >= 1000000 = error "Too large"
  | x < 0 = "minus " ++ convert (-x)
  | x == 0 = "zero"
  | x == 1 = "one"
  | x == 2 = "two"
  | x == 3 = "three"
  | x == 4 = "four"
  | x == 5 = "five"
  | x == 6 = "six"
  | x == 7 = "seven"
  | x == 8 = "eight"
  | x == 9 = "nine"
  | x == 10 = "ten"
  | x == 11 = "eleven"
  | x == 12 = "twelve"
  | x == 13 = "thirteen"
  | x == 15 = "fifteen"
  | x == 18 = "eighteen"
  | x < 20 = convert (x - 10) ++ "teen"
  | x == 20 = "twenty"
  | x == 30 = "thirty"
  | x == 40 = "forty"
  | x == 50 = "fifty"
  | x == 80 = "eighty"
  | x < 100 && x `mod` 10 == 0 = convert (x `div` 10) ++ "ty"
  | x < 100 = convert (x `div` 10 * 10) ++ " " ++ convert (x `mod` 10)
  | x < 1000 = convert (x `div` 100) ++ " hundred and " ++ convert (x `mod` 100)
  | otherwise = convert (x `div` 1000) ++ " thousand " ++ convert (x `mod` 1000)
