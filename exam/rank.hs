import Test.QuickCheck

data Rank = Numeric Int 
            | Jack | Queen | King | Ace
            deriving Show
data Suit = Heart | Diamond | Spade | Club
            deriving Show
data Card = Rank Suit

rankBeats :: Rank -> Rank -> Bool
rankBeats _ Ace = False
rankBeats Ace _ = True
rankBeats _ King = False
rankBeats King _ = True
rankBeats _ Queen = False
rankBeats Queen _ = True
rankBeats _ Jack = False
rankBeats Jack _ = True
rankBeats (Numeric m) (Numeric n) = m > n

prop_RankBeats a b = 
    rankBeats a b || rankBeats b a