
square :: Integer -> Integer
square x = x*x

nats :: [Integer]
nats = [1..]

nats' :: [Integer]
nats' = [a | a <- [1..]]

squares :: [Integer]
squares = map square nats

squares' :: [Integer]
squares' = [a*a | a <- nats, a <= 49]

eqzero :: Int -> Bool
eqzero x = x == 0

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (a:as) = f a : map' f as

map'' :: (a -> b) -> [a] -> [b]
map'' f as = [f b | b <- as]

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (a:as) = if f a
                    then a : filter' f as
                   else filter' f as

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' f as = [a | a <- as, f a] 

bitString :: Int -> [String]
bitString 0 = [""]
bitString n = [x ++ y | x <- ["0", "1"], y <- bitString(n-1)]

bitStrings :: Int -> [String]
bitStrings n = concat(map bitString [1..n])

data Reaction = Happy | Sad | Eclectic
class Pretty a where
    pretty :: a -> String
    
instance Pretty Reaction where
    pretty Happy = "1"
    pretty Sad = "2"
    pretty Eclectic = "3"

instance Eq Reaction where
    Happy == Happy = True
    Sad == Sad = True
    Eclectic == Eclectic = True
    _ == _ = False

class Greeting a where
    greet :: a -> String

instance Greeting Bool where
    greet True = "Hello!"
    greet False = "Goodbye"


data Suit = Heart | Diamond | Club | Spade 
        deriving (Show,Eq, Ord)

data Face = Ace | Two | Three | Four | Five | Six | Seven
            | Eight | Nine | Ten | Jack | Queen | King
    deriving (Show,Eq, Ord)

data Card = Joker | Card (Face, Suit) 
        deriving (Show,Eq)

instance Ord Card where
    Joker > _ = True
    ()