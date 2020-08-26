import System.IO
import Data.List.Split

myLines = splitOn "\n"

toInts :: String -> [Int]
toInts = map read . lines

main :: IO ()
main = do
  userInput <- getContents
  let numbers = toInts userInput
  print (sum numbers)