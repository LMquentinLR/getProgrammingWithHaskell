-- The List type is both a container and a context.

doorPrize :: [Int]
doorPrize = [1000,2000,3000]

boxPrize :: [Int]
boxPrize = [500, 20000]

boxMultiplier :: [Int]
boxMultiplier = [10,50]

-- totalPrize :: Int -- Deterministic context
-- totalPrize = (+) doorPrize boxPrize

totalPrize :: [Int]
totalPrize = (pure (+)) <*> doorPrize <*> boxPrize

newOutcomes :: [Int]
newOutcomes = pure (*) <*> doorPrize <*> boxMultiplier

main :: IO ()
main = do
  print (pure (+) <*> [1,2,3] <*> [5,10])
  --
  print (totalPrize)
  print (newOutcomes)