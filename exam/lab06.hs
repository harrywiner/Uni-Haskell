import System.Environment

helloWorld :: IO()
helloWorld = putStrLn "Hello, World!"

echo :: IO ()
echo = do line <- getLine
          putStrLn line

sayHello :: String -> String
sayHello s = "Hello " ++ s

toString :: [Char] -> String
toString xs = xs

greet :: IO ()
greet = do name <- getLine
           putStrLn (sayHello name)

greet' :: IO ()
greet' = do putStrLn "What is your name?"
            name <- getLine
            putStrLn (sayHello name)

getInt :: IO Int
getInt = do x <- getLine
            return (read x :: Int)

echoArgs :: IO()
echoArgs = do aargs <- getArgs
              print aargs

addLineStart :: [String] -> [String]
addLineStart xs = map (\x -> "> " ++ x) xs

addLineStartToFile :: String -> String
addLineStartToFile str = unlines (addLineStart (lines str))

hsToLhs :: String -> String -> IO ()
hsToLhs input output = do inputText <- readFile input
                          writeFile output (addLineStartToFile inputText)

playRound :: Int -> IO()
playRound num = do guessStr <- getLine
                   let guess = read guessStr :: Int
                   if (num == guess)
                   then print "You got it right!"
                   else if (guess > num)
                   then do print "Too high"
                           playRound num
                   else do print "Too low"
                           playRound num


main = echoArgs