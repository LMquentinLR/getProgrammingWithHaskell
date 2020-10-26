import Data.List

permutationsStartingWith :: Char -> String -> [String]
permutationsStartingWith letter = 
  filter (\l -> head l == letter) . permutations

data Range = Range Integer Integer deriving Show

range :: Integer -> Integer -> Range {-- smart constructor --}
range a b = if a <= b then Range a b else error "a must be <= b"

main :: IO ()
main = do
  print "-- ALL LOADED --"
  
