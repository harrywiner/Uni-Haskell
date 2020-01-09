
sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

fromJusts :: [Maybe a] -> [a]
fromJusts [] = []
fromJusts ((Just x):xs) = x : fromJusts xs
fromJusts (_:xs) = fromJusts xs

insert :: Int -> [Int] -> [Int]
insert x (y:ys) = if (x <= y)
                    then x : y : ys
                  else y : insert x ys

isort :: [Int] -> [Int]
isort (x:[]) = [x]
isort (x:xs) =  do
                insert x (isort xs)
                
merge :: [Int] -> [Int] -> [Int]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if (x > y)
                        then y : merge (x:xs) ys
                      else x : merge xs (y:ys)

split :: [a ] -> ([a ], [a ])
split [ ] = ([ ], [ ])
split (x : xs) = (x : ys, zs)
    where
        (zs, ys) = split xs

