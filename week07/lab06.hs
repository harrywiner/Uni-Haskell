

helloWorld :: IO()
helloWorld = putStrLn "Hello Boozer!"

helloName :: String -> String
helloName a = "Hello " ++ a



greet :: IO ()
greet = do line <- getLine
           putStrLn (helloName line)

greet' :: IO()
greet' = do putStrLn "What is your name?"
            line <- getLine
            putStrLn (helloName line)

getInt :: IO (Int)
getInt = do s <- getLine
            return (read s :: Int)

            
playRound :: Int -> IO()
playRound x = do putStrLn "Guess"
                 y <- getInt
                 if y == x 
                    then putStrLn "You got it!"
                 else if y < x 
                    then do 
                        putStrLn "Too low"
                        (playRound x)
                 else do 
                        putStrLn "Too high"
                        (playRound x)


addOneLine :: String -> String
addOneLine s = "> " ++ s

addLineStart :: [String] -> [String]
addLineStart xs = map addOneLine xs 

addLineStartToFile :: String -> String
addLineStartToFile s = unlines (addLineStart (lines s)) 

hsTolhs :: String -> String -> IO ()
hsTolhs hs lhs = do 
                    s <- readFile hs 
                    writeFile lhs (addLineStarttoFile contentH)
