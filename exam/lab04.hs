sum' :: [Integer] -> Integer
sum' xs = foldr (+) 0 xs

product' :: [Integer] -> Integer
product' xs = foldr (*) 1 xs

and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

or' :: [Bool] -> Bool
or' xs = foldr (||) False xs

all' :: (a -> Bool) -> [a] -> Bool
all' f xs = foldr ((&&) . f) True xs

any' :: (a -> Bool) -> [a] -> Bool
any' f xs = foldr ((||) . f) True xs

length' :: [a] -> Int
length' xs = foldr (const (+1)) 1 xs

snoc' :: [a] -> a -> [a]
snoc' xs x = xs ++ [x]

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = snoc' (reverse xs) x

transpose :: [[a]] -> [[a]]
transpose (c:(r:rs)) = 
