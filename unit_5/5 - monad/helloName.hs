askForName :: IO ()
askForName = putStrLn "What is your name?"

nameStatement :: String -> String
nameStatement name = "Hello, " ++ name ++ "!"

main :: IO ()
main = askForName >> getLine 
       >>= (\name -> return (nameStatement name)) 
       >>= putStrLn