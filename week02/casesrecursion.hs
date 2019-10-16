absolute :: Int -> Int
absolute x | x >= 0 = x
           | x <  0 = -x

power :: Int -> Int -> Int
power x 0 = 1
power x n = x * power x (n - 1)

repli :: Int -> String -> String
repli 0 s = ""
repli n "" = ""
repli n s = s ++ repli (n-1) s

data Suit = Spades | Hearts
          | Clubs  | Diamonds
