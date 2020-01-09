

sums :: [Int] -> Int
sums [] = 0
sums (x:xs) = x + sums xs

fromJusts :: [Maybe a] -> [a]
