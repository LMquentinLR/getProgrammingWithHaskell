module Main where

import Lib
import Chapter2.Section2.Example
import Chapter2.SimpleFunctions

main :: IO ()
main = do
  print x
  someFunc
  --
  print "-----------"
  print $ firstOrEmpty []
  print $ firstOrEmpty ["Hello World"]
  print $ [1,2] +++ [3,4]
  print $ reverse2 [1,2,3,4]
