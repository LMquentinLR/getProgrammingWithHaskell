import Control.Monad

powersOfTwo :: Int -> [Int]
powersOfTwo n = do 
  values <- [1 .. n]
  return (2^values)

powersOfTwoMap :: Int -> [Int]
powersOfTwoMap n = map (\x -> 2^x) [1 .. n]

powersOfTwoAndThree :: Int -> [(Int, Int)]
powersOfTwoAndThree n = do
  value <- [1 .. n]
  let powersOfTwo   = 2^value
  let powersOfThree = 3^value
  return (powersOfTwo, powersOfThree)
  
allEvenOdds :: Int -> [(Int, Int)]
allEvenOdds n = do
  evenValue <- [2,4 .. n]
  oddValue  <- [1,3 .. n]
  return (evenValue, oddValue)
  
-- GUARDS

evensGuard :: Int -> [Int]
evensGuard n = do
  value <- [1 .. n]
  guard (even value)
  return value
  
guardFilter :: (a -> Bool) -> [a] -> [a]
guardFilter test vals = do
  val   <- vals
  guard (test val)
  return val
  
evenSquares :: [Int]
evenSquares = do
  n <- [0 .. 9]
  let nSquared = n^2
  guard (even nSquared)
  return nSquared
  
powersOfTwoAndThreeGuard :: Int -> [(Int, Int)]
powersOfTwoAndThreeGuard n = [ (powersOfTwo, powersOfThree)
                             | value <- [1 .. n]
                             , let powersOfTwo   = 2^value
                             , let powersOfThree = 3^value ]
     
allEvenOddsGuard :: Int -> [(Int, Int)]
allEvenOddsGuard n = [ (evenValue, oddValue) | evenValue <- [2, 4 .. n]
                                             , oddValue  <- [1, 3 .. n] ]
  
evensGuard2 :: Int -> [Int]
evensGuard2 n = [ value | value <- [1 .. n], even value]