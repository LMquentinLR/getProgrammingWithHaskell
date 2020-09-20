import Data.Typeable
import Data.Maybe

fibonacci :: Int -> Int
fibonacci n = case n of
                0 -> 0
                1 -> 1
                _ -> fibonacci (n-1) + fibonacci (n-2)

main :: IO  ()
main = do
  print "Please enter a number."
  n <- getLine
  print $ fibonacci $ read n
