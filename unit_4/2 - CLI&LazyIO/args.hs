import System.Environment

--getArgs :: IO [String]

--ghci> :set args foo bar
--ghci> main

--ghci> :main foo bar

main :: IO ()
main = do
  args <- getArgs
  --map putStrLn args
  --mapM putStrLn args
  mapM_ putStrLn args
