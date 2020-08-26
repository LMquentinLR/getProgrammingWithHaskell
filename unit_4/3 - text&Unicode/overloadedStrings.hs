{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T

aWord :: T.Text
aWord = "Cheese"

sampleInput :: T.Text
sampleInput = "this\nis\ninput"

someText :: T.Text
someText = "Some\ntext for\t you"

breakText :: T.Text
breakText = "simple"

exampleText :: T.Text
exampleText = "this is simple to do"

main :: IO ()
main = do
  print aWord
  print (T.lines sampleInput)
  print (T.words someText)
  print (T.splitOn breakText exampleText)
  print (T.unlines (T.lines sampleInput))
  print (T.unwords (T.words someText))
  print (T.intercalate breakText (T.splitOn breakText exampleText))