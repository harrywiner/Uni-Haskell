sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + Main.sum xs

square :: Int -> Int
square x = x*x