{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import Data.Semigroup

combined :: String
combined = "some" ++ " " ++ "strings" 
-- ++ doesn't work on type T.Text

combinedTextMonoid :: T.Text
combinedTextMonoid = mconcat ["some", " ", "strings"]

combinedTextSemigroup :: T.Text
combinedTextSemigroup = "some" <> " " <> "strings"

--own version of T.lines
myLines :: T.Text -> [T.Text]
myLines text = T.splitOn " " text


myUnlines :: [T.Text] -> T.Text
myUnlines textLines = T.intercalate "\n" textLines

--own version of T.unlines

main :: IO ()
main = do
  print (combined)
  print (combinedTextMonoid)
  print (combinedTextSemigroup)
  print (myLines combinedTextSemigroup)
  print (myUnlines (myLines combinedTextSemigroup))