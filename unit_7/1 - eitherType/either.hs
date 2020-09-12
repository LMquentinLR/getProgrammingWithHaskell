import           Data.Maybe

data PrimeError = TooLarge | InvalidValue
instance Show PrimeError where
  show TooLarge = "Value exceed max bound"
  show InvalidValue = "Value is not a valid candidate for prime checking"

-- easily throws an error when used but compiles fine
myTake :: Int -> [a] -> [a]
myTake 0 _  = []
myTake n xs = head xs : myTake (n-1) (tail xs)

-- throws a compiler warning: ghci either.hs -Wall
myTakePM :: Int -> [a] -> [a]
-- missing pattern: myTakePM _ [] = []
myTakePM 0 _      = []
myTakePM n (x:xs) = x : myTakePM (n-1) xs

myHead :: [a] -> a
myHead []    = error "empty list"
myHead (x:_) = x

maybeHead :: [a] -> Maybe a
maybeHead []    = Nothing
maybeHead (x:_) = Just x

-- safer version of myTake using maybeHead instead of head
myTakeSafer :: Int -> Maybe [a] -> Maybe [a]
myTakeSafer 0 _ = Just []
myTakeSafer n (Just xs) = (:) <$> maybeHead xs
                              <*> myTakeSafer (n-1) (Just (tail xs))

-- introducing the Either type
primes :: [Int]
primes = [2,3,5,7]

maxN :: Int
maxN = 10

isPrime :: Int -> Maybe Bool
isPrime n
  | n < 2 = Nothing
  | n > maxN = Nothing
  | otherwise = Just (n `elem` primes)

--- EITHER

intExample :: [Int]
intExample = [1,2,3]

intExampleEmpty :: [Int]
intExampleEmpty = []

charExample :: [Char]
charExample = "cat"

charExampleEmpty :: [Char]
charExampleEmpty = ""

eitherHead :: [a] -> Either String a
eitherHead []     = Left "There is no head because the list is empty."
eitherHead (x:xs) = Right x

isPrimeEither :: Int -> Either String Bool
isPrimeEither n
    | n < 2 = Left "Numbers less than 2 are not candidates for primes."
    | n > maxN = Left "Value exceeds limits of prime checker."
    | otherwise = Right (n `elem` primes)

isPrime2 :: Int -> Either PrimeError Bool
isPrime2 n
    | n < 2 = Left InvalidValue
    | n > maxN = Left TooLarge
    | otherwise = Right (n `elem` primes)   

displayResult :: Either PrimeError Bool -> String
displayResult (Right True) = "It's prime."
displayResult (Right False) = "It's composite."
displayResult (Left primeError) = show primeError

main :: IO ()
main = do
  print $ maybeHead [1]
  print $ maybeHead ([]::[Int])
  print $ (:) <$> maybeHead [1,2,3] <*> Just []
  print $ (:) <$> maybeHead ([]::[Int]) <*> Just []
  print $ myTakeSafer 3 (Just [1,2,3])
  print $ myTakeSafer 6 (Just [1,2,3])
  print $ eitherHead intExample
  print $ eitherHead intExampleEmpty
  print $ eitherHead charExample
  print $ eitherHead charExampleEmpty
  print $ (+1) <$> (eitherHead intExample)
  print $ (+1) <$> (eitherHead intExampleEmpty)
  print $ isPrimeEither 5
  print $ isPrimeEither 6
  print $ isPrimeEither 100
  print $ isPrimeEither (-29)
  print $ isPrime2 99
  print $ isPrime2 0
  print "Enter a number to test for primality:"
  n <- read <$> getLine
  let result = isPrime2 n
  print (displayResult result) 
