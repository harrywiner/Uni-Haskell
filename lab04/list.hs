
sum' :: [Int] -> Int
sum' (x:xs) | xs == []  = x
            | otherwise = x + sum xs

insert :: Int -> [Int] -> [Int]
insert y [] = [y]
insert y (x:xs) | y < x     = y:x:xs
                | otherwise = [x] ++ insert y xs


merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)     | x < y = x:(merge xs (y:ys))
                        | otherwise = [y] ++ merge (x:xs) ys


repeat :: a -> [a]
repeat x = x:Main.repeat x

