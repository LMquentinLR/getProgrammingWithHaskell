x :: Int
x = 2

y :: Integer
y = 2

letter :: Char
letter = 'a'

digit :: String
digit = "2"

interestRate :: Double
interestRate = 0.375

isFun :: Bool
isFun = True

values :: [Int]
values = [1,2,3]

testScores :: [Double]
testScores = [0.99, 0.7, 0.8]

letters :: [Char]
letters = ['a', 'b', 'c']
-- letters == "abc" => True

aPet :: [Char]
aPet = "cat"

anotherPet :: String
anotherPet = "dog"

--Tuple
ageAndHeight :: (Int, Int)
ageAndHeight = (34, 74)

firstLastMiddle :: (String, String, Char)
firstLastMiddle = ("Oscar", "Grouch", 'D')

streetAddress :: (Int, String)
streetAddress = (123, "Happy St.")

double :: Int -> Int
double n = n*2

z :: [Int]
z = map double values

half :: Int -> Double
--half n = n/2 -- throws an error
half n = (fromIntegral n) / 2

a :: [Double]
a = map half values

intHalf :: Int -> Int
intHalf n = n `div` 2

main = do
  print z
  print a
  print (show x)
  print (read digit :: Int)