delta :: Int -> Int
delta 0 = 1;
delta x = 0;

dirac :: Int -> (Int -> Int) -> Int
dirac n f = f(n)

not' :: Bool -> Bool
not' True = False
not' False = True

factorial' :: Int -> Int
factorial' 0 = 1
factorial' x = x * factorial' (x-1)

isJust :: Maybe a -> Bool
isJust (Just x) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing = not' . isJust

safeDiv :: Int -> Int -> Maybe Int
safeDiv x 0 = Nothing
safeDiv x y = Just (div x y)

fromMaybe :: a -> Maybe a -> a
fromMaybe a (Just b) = b
fromMaybe a Nothing = a

perform :: (Int -> Int) -> Maybe Int -> Maybe Int
perform f (Just x) = Just (f x)
perform f Nothing = Nothing

forget :: Either String a -> Maybe a
forget (Right y) = Just y

safeDiv' :: Int -> Int -> Either String Int
safeDiv' x 0 = Left "Err div by 0"
safeDiv' x y = Right (div x y)