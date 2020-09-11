{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( isPalindrome
    , preProcess
    ) where

import           Data.Char (isPunctuation)
import           Data.Text as T

preProcess :: T.Text -> T.Text -- T.Text replaces String with import Data.Text as T
--preProcess text = filter (not . (`elem` ['!', '.', '#', '['])) text
preProcess text = T.filter (not . isPunctuation) text

isPalindrome :: T.Text -> Bool
isPalindrome text = cleanText == T.reverse cleanText
  where cleanText = preProcess text
