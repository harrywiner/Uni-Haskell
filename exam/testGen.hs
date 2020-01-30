import Test.QuickCheck 

react :: String -> String
react str  
    | "Harry" == str = "Fuck off harry"
    | "Elif" == str = "Gay"
    | "Seth" == str = "Double gay"
    | otherwise = "I dont know you "

prompt :: IO ()
prompt = do s <- getLine
            putStrLn ("omg " ++ s)

example :: Integer -> [Integer]
example n = [x | x <- [1..n], even x, x `mod` 3 == 1, x `mod` 10 == 0]


prop_Whole n xs = 
    take n xs ++ drop n xs == xs

prop_Sort xs = 
    xs == reverse (reverse xs)