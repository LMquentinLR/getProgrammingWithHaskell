import System.Environment
import Control.Monad

--getArgs :: IO [String]

--ghci> :set args foo bar
--ghci> main

--ghci> :main foo bar

main :: IO ()
main = do
  args <- getArgs
  let linesToRead = if length args > 0
                    then read (head args)
                    else 0 :: Int
  numbers <- replicateM linesToRead getLine
  let ints = map read numbers :: [Int]
  print (sum ints)