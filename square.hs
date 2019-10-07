square :: Int -> Int
square n = n * n

two :: Int -> Int
two n = 2

add :: (Int,Int) -> Int
add (x,y) = x + y

plus :: Int -> (Int -> Int)
plus x y = x + y

-- plus 7 :: Int -> Int
-- plus 7 y = 7 + y
