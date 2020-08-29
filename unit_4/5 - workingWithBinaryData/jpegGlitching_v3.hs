{-# LANGUAGE OverloadedStrings #-}

import System.Environment
import System.Random
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

intToChar :: Int -> Char
intToChar int = toEnum safeInt
  where safeInt = int `mod` 255
  
intToBC :: Int ->  BC.ByteString 
intToBC int = BC.pack [intToChar int]

deterministicReplaceByte :: Int -> Int -> BC.ByteString -> BC.ByteString
deterministicReplaceByte loc charVal bytes = mconcat [before, newChar, after]
  where (before, rest) = BC.splitAt loc bytes
        after = BC.drop 1 rest
        newChar = intToBC charVal

randomReplaceByte :: BC.ByteString -> IO BC.ByteString
randomReplaceByte bytes = do
  let bytesLength = BC.length bytes
  location <- randomRIO (1, bytesLength)
  charVal <- randomRIO (0, 255)
  return (deterministicReplaceByte location charVal bytes)
  
sortSection :: Int -> Int -> BC.ByteString -> BC.ByteString
sortSection start size bytes = mconcat [before, changed, after]
  where (before, rest) = BC.splitAt start bytes
        (target, after) = BC.splitAt size rest
        changed = BC.reverse (BC.sort target)

randomSortSection :: BC.ByteString -> IO BC.ByteString
randomSortSection bytes = do
  let sectionSize = 25
  let bytesLength = BC.length bytes
  start <- randomRIO (0, bytesLength - sectionSize)
  return (sortSection start sectionSize bytes)
  
main :: IO ()
main = do
  args <-  getArgs -- :set args art.jpg
  let fileName = head args
  imageFile <- BC.readFile fileName
  glitched1 <- randomReplaceByte imageFile
  glitched2 <- randomSortSection glitched1
  glitched3 <- randomReplaceByte glitched2
  glitched4 <- randomSortSection glitched3
  glitched5 <- randomReplaceByte glitched4
  glitched6 <- randomSortSection glitched5
  let glitchedFileName = mconcat ["glitched_", fileName]
  BC.writeFile glitchedFileName glitched6
  putStrLn ">> Glitching is done."