import Data.List
import Data.Semigroup

-- function compositions
myLast :: [a] -> a
myLast = head . reverse

myMin :: Ord a => [a] -> a
myMin = head . sort

myMax :: Ord a => [a] -> a
myMax = myLast . sort

myAll :: (a -> Bool) -> [a] -> Bool
myAll testFunc = (foldr (&&) True) . (map testFunc)

myAny :: (a -> Bool) -> [a] -> Bool
myAny testFunc = (foldr (||) False) . (map testFunc)

-- semigroups

instance Semigroup Integer where
  (<>) x y = x + y
-- (<>) :: Semigroup a => a -> a -> a

data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown deriving (Show, Eq)

--instance Semigroup Color where -- DOESN'T HAVE ASSOCIATIVITY
--  (<>) Red Blue = Purple
--  (<>) Blue Red = Purple
--  (<>) Yellow Blue = Green
--  (<>) Blue Yellow = Green
--  (<>) Yellow Red = Orange
--  (<>) Red Yellow = Orange
--  (<>) a b = if a == b
--             then a
--             else Brown

instance Semigroup Color where -- HAS ASSOCIATIVITY
  (<>) Red Blue = Purple
  (<>) Blue Red = Purple
  (<>) Yellow Blue = Green
  (<>) Blue Yellow = Green
  (<>) Yellow Red = Orange
  (<>) Red Yellow = Orange
  (<>) a b | a == b = a
           | all (`elem` [Red, Blue, Purple]) [a, b] = Purple
           | all (`elem` [Blue, Yellow, Green]) [a, b] = Green
           | all (`elem` [Red, Yellow, Orange]) [a, b] = Orange
           | otherwise = Brown

main = do
  -- function compositions
  let x = [1,2,5,2,35,1,43]
  print(myLast x)
  print(myMin x)
  print(myMax x)
  print(myAll even x)
  print(myAny even x)
  
  -- semigroups
  print((<>) 2 3)
  print((<>) Red Yellow)
  print(Red <> Yellow)
  print(Red <> Blue)
  print((Green <> Blue) <> Yellow)
  print(Green <> (Blue <> Yellow))
  