lucky :: Int -> String
lucky 7 = "Lucky number 7"
lucky x = "Fuck off cunt"

first :: (a,b,c) -> a
first (x,_,_) = x

second :: (a,b,c) -> b
second (_,y,_) = y

third :: (a,b,c) -> c
third (_,_,z) = z