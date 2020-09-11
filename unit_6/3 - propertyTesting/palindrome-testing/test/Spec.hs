{-# LANGUAGE OverloadedStrings #-} 

module Main where

import           Data.Char                 (isPunctuation)
import           Data.Text                 as T
import           Data.Text.IO              as TIO
import           Lib
import           Test.QuickCheck
import           Test.QuickCheck.Instances

assert :: Bool -> T.Text -> T.Text -> IO ()
assert test passStatement failStatement = if test
                                          then TIO.putStrLn passStatement
                                          else TIO.putStrLn failStatement

prop_punctuationInvariant text = preProcess text == preProcess noPuncText
  where noPuncText = T.filter (not . isPunctuation) text

prop_reverseInvariant text = isPalindrome text == isPalindrome (T.reverse text)

main :: IO ()
main = do
  Prelude.putStrLn "Running tests..."
  assert (isPalindrome "racecar") "passed 'racecar'" "FAIL: 'racecar'"
  assert (isPalindrome "racecar!") "passed 'racecar!'" "FAIL: 'racecar!'"
  assert ((not . isPalindrome) "cat") "passed 'cat'" "FAIL: 'cat'"
  assert (isPalindrome "racecar.") "passed 'racecar.'" "FAIL: 'racecar.'"
  assert (isPalindrome ":racecar:") "passed ':racecar:'" "FAIL ':racecar:'"
  quickCheckWith stdArgs { maxSuccess = 1000 } prop_punctuationInvariant
  --quickCheck prop_punctuationInvariant
  quickCheck prop_reverseInvariant
  Prelude.putStrLn "Done"
