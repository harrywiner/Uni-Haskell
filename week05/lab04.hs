import Prelude hiding (sum, product, and, or , all, any, length, lengths , foldl, reverse, filter )

sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs

product :: [Int] -> Int
product [] = 1
product (x:xs) = x * product xs


length :: [Int] -> Int
length [] = 0
length (x:xs) = 1 + length xs

all :: (a -> Bool) -> [a] -> Bool
all p [] = True
all p (x:xs) = if p x then all p xs
                else False

and :: [Bool] -> Bool
and [] = True
and (x:xs) =   if x then and xs 
                else False




sumr :: [Int] -> Int
sumr xs = foldr (+) 0 xs

productr :: [Int] -> Int
productr xs = foldr (*) 1 xs

andr :: [Bool] -> Bool
andr xs = foldr (&&) True xs

orr :: [Bool] -> Bool
orr xs = foldr (||) False xs

eqzero :: Int -> Bool
eqzero 0 = True
eqzero _ = False

allr :: (a -> Bool) -> [a] -> Bool
allr p xs = foldr (\a b -> p(a) && b) True xs

anyr :: (a -> Bool) -> [a] -> Bool
anyr p xs = foldr (\a b -> p(a) || b) False xs

lengthr :: [a] -> Int
lengthr = foldr (const(+1)) 0

snoc :: [a] -> a -> [a]
snoc xs x = xs ++ [x]

reverse :: [a] -> [a]
reverse xs = foldr (\y ys -> snoc ys y) [] xs

filter :: (a -> Bool) -> [a] -> [a]
filter f xs = foldr (consIf f) [] xs
    where 
        consIf p x xs
            | p x       = x:xs
            | otherwise = xs

two :: Int -> Int
two x = input * favNum
        where favNum = 2
              input = x

lengthsr :: [[a]] -> [Int]
lengthsr xs = foldr (lengthr) [] xs