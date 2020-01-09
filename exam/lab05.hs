
square :: Integer -> Integer
square x = x*x

nats :: [Integer]
nats = [1..]

squares :: [Integer]
squares = map square nats

eqzero :: Int -> Bool
eqzero x = x == 0

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (a:as) = f a : map' f as

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (a:as) = if f a
                    then a : filter' f as
                   else filter' f as

cartesian' :: [a] -> [b] -> [(a,b)]
cartesian' as bs = [(a,b) | a <- (as), b <- (bs)]

data Reaction = Happy | Sad | Eclectic
class Pretty a where
    pretty :: a -> String
    
instance Pretty Reaction where
    pretty Happy = "1"
    pretty Sad = "2"
    pretty Eclectic = "3"

class Greeting a where
    greet :: a -> String

instance Greeting Bool where
    greet True = "Hello!"
    greet False = "Goodbye"


data Suit = Heart | Diamond | Club | Spade deriving (Show,Eq)
data Face = Ace | Two | Three | Four | Five | Six | Seven
            | Eight | Nine | Ten | Jack | Queen | King deriving (Show,Eq, Ord)
data Card = Joker | Card (Face, Suit) deriving (Show,Eq)

instance Ord a b => Ord Card Card where
    