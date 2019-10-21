import Test.QuickCheck.hs

data Card = Card Rank Suit
    deriving Show
rank :: Card -> Rank
rank (Card r s) = r

suit :: Card -> Suit


data Rank = Numeric Integer
            | Jack | Queen | King | Ace
            deriving Show

rankBeats :: Rank -> Rank -> Bool

rankBeats _ Ace    = False
rankBeats Ace _    = True
rankBeats _ King   = False
rankBeats King _   = True
rankBeats _ Queen  = False
rankBeats Queen _  = True
rankBeats _ Jack   = False
rankBeats Jack _   = True
rankBeats (Numeric m) (Numeric n) = m > n



--

