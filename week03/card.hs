
import Test.QuickCheck

-------------------------------------------------------------------------

-- datatype for suit of a card
data Suit = Spades | Hearts | Diamonds | Clubs
  deriving (Eq, Show)

-- datatype for colour of a card
data Colour = Black | Red
  deriving (Eq, Show)

colour :: Suit -> Colour
colour Spades   = Black
colour Hearts   = Red
colour Diamonds = Red
colour Clubs    = Black

-------------------------------------------------------------------------

-- datatype for rank of a card
data Rank = Numeric Integer | Jack | Queen | King | Ace
  deriving (Eq, Show)

-- rankBeats rank1 rank2 checks if rank1 beats rank2
rankBeats :: Rank -> Rank -> Bool
rankBeats _           Ace         = False
rankBeats Ace         _           = True
rankBeats _           King        = False
rankBeats King        _           = True
rankBeats _           Queen       = False
rankBeats Queen       _           = True
rankBeats _           Jack        = False
rankBeats Jack        _           = True
rankBeats (Numeric m) (Numeric n) = m > n

prop_RankBeats a b =
   a /= b ==> rankBeats a b || rankBeats b a

prop_SameRank a = not (rankBeats a a)

-------------------------------------------------------------------------

-- datatype for card: a rank and a suit
data Card = Card Rank Suit
  deriving (Eq, Show)

rank :: Card -> Rank
rank (Card r s) = r

suit :: Card -> Suit
suit (Card r s) = s

-- cardBeats card1 card2 checks if card1 beats card2
cardBeats :: Card -> Card -> Bool
cardBeats c c' = suit c == suit c' && rankBeats (rank c) (rank c')

-------------------------------------------------------------------------

-- datatype for a hand of cards
data Hand = Empty | Add Card Hand
  deriving (Eq, Show)

-- handBeats hand card checks if hand beats card
handBeats :: Hand -> Card -> Bool
handBeats Empty     c' = False
handBeats (Add c h) c' = cardBeats c c' || handBeats h c'

-- chooseCard beat hand chooses a card from hand to
-- play, when beat is the card to be beaten
chooseCard :: Card -> Hand -> Card
chooseCard = undefined


haveCard :: Card -> Hand -> Bool
haveCard c Empty = False
haveCard c (Add c' h) = c == c' || haveCard c h













-------------------------------------------------------------------------

instance Arbitrary Suit where
  arbitrary = elements [Spades, Hearts, Diamonds, Clubs]

instance Arbitrary Rank where
  arbitrary =
    oneof $
      [ do return c
      | c <- [Jack,Queen,King,Ace]
      ] ++
      [ do n <- choose (2,10)
           return (Numeric n)
      ]
  shrink Ace = [King]
  shrink King = [Queen]
  shrink Queen = [Jack]
  shrink Jack = [Numeric 10]
  shrink (Numeric n) = [Numeric n' | n' <- shrink n, 2<=n']

instance Arbitrary Card where
  arbitrary =
    do r <- arbitrary
       s <- arbitrary
       return (Card r s)
  shrink (Card r s) =
    [Card r' s | r' <- shrink r]

instance Arbitrary Hand where
  arbitrary =
    do cs <- arbitrary
       let hand []     = Empty
           hand (c:cs) = Add c (hand [ c' | c' <- cs, c' /= c ])
       return (hand cs)
  shrink (Add c h) =
    h : [Add c' h' | (c',h') <- shrink (c,h)]
  shrink Empty = []

-------------------------------------------------------------------------

{-
  | cardBeats c  beat && not (cardBeats c' beat) = c
  | cardBeats c' beat && not (cardBeats c beat)  = c'
-}
