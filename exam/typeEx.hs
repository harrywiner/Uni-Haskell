data Greeting = Hello | Goodbye

instance Show Greeting where
        show Hello = "How are you doing"
        show Goodbye = "See you later!"

instance Eq Greeting where
        Hello == Hello = True
        Goodbye == Goodbye = True
        _ == _ = False

instance Ord Greeting where
        Hello > Goodbye = True
        Hello <= Goodbye = False
        Goodbye < Hello = True

data Name = Harry | Seth | Elif
        deriving (Show, Eq)


take' :: Int -> [a] -> [a]
take' n [] = []
take' n (x:xs) = x : take (n-1) xs