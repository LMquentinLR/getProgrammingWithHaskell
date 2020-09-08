module OldMain where

head :: Monoid a => [a] -> a
head (x:xs) = x
head [] = mempty

example :: [[Int]]
example = []

main :: IO()
main = do
  print $ "Module oldMain.hs loaded"
-- Main.head example
-- Prelude.head example
