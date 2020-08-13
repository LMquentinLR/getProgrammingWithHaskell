import Data.Semigroup
-- in Haskell, Monoind predates Semigroup and isn't officially a subclass of Semigroup

class Monoid a where
  mempty :: a
  mappend :: a -> a -> a
  mconcat :: [a] -> a 
  -- mconcat = foldr mappend mempty
  
main = do
  print([1,2,3] ++ [])
  print([1,2,3] <> [])
  print([1,2,3] `Prelude.mappend` Prelude.mempty)
  print(Prelude.mconcat ["Does", " this", " make", " sense?"])
  --Monoid law
  print([] ++ [1,2,3])
  print([1,2,3] ++ [])
  print([1] ++ ([2] ++ [3]) == ([1] ++ [2]) ++ [3])