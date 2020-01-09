nats :: [Int]
nats = [1..25]

square :: Int -> Int
square x = x*x

squares :: [Int] -> [Int]
squares xs = map square xs

class Pretty a where 
    whos :: a -> String

data Reaction = Joe | Sugma | Ligma | Mike | Candice | Fugma

instance Pretty Reaction where
    whos Joe      = "Joe mamma"
    whos Sugma    = "Sugma dick"
    whos Ligma    = "Ligma balls"
    whos Mike     = "Mike cock/clitorous"
    whos Candice  = "Candice dick fit in your mouth"
    whos Fugma    = "Fugma ass"

