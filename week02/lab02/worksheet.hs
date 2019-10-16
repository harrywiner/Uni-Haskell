factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial x = x * factorial(x - 1)

isJust :: Maybe a -> Bool
isJust (Just x) = True
isJust _ = False

isNothing :: Maybe a -> Bool
isNothing = not.isJust

fromMaybe :: a -> Maybe a -> a
fromMaybe y (Just x)  = x
fromMaybe y (Nothing) = y