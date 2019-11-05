import Prelude hiding (sum, product, and, or , all, any, length, lengths , foldl, reverse, filter )

sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs

product :: [Int] -> Int
product [] = 1
product (x:xs) = x * product xs

and :: [Bool] -> Bool
and [] = True
and (x:xs) =   if x then and xs 
                else False

length :: [Int] -> Int
length [] = 0
length (x:xs) = 1 + length xs

all :: (a -> Bool) -> [a] -> Bool
all p [] = True
all p (x:xs) = if p x then all p xs
                else False

and2 :: [Bool] -> Bool
and2 = foldr (&&) True

all2 :: (a->Bool) -> [a] -> Bool 
all2 p xs = foldr (\a b -> p(a) && b) True xs

