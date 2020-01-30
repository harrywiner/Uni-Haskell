
choose :: Bool -> a -> b -> Either a b
choose True a _ = (Left a)
choose False _ b = (Right b)

cloudCloud :: Double
cloudCloud = 0.69

square' :: Int -> Int
square' x = x * x

isPositive :: Int -> Bool
isPositive x = x > 0

takeAway :: (Int, Int) -> Int
takeAway (x,y) = x - y

subtract :: Int -> Int -> Int
subtract x y = takeAway(x,y)

apply :: (a -> b) -> a -> b
apply f x = f x

