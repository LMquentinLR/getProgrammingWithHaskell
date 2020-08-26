import qualified Data.Text as T

firstWord :: String
firstWord = "pessimism"

secondWord :: T.Text
secondWord = T.pack firstWord

thirdWord :: String
thirdWord = T.unpack secondWord

--myWord :: T.Text
--myWord = "dog"
-- throws error
-- Couldn't match expected type `T.Text' with actual type `[Char]'

myNum1 :: Int
myNum1 = 3

myNum1 :: Integer
myNum1 = 3

myNum1 :: Double
myNum1 = 3

main = do
  print (firstWord)
  print (secondWord)
  print (thirdWord)