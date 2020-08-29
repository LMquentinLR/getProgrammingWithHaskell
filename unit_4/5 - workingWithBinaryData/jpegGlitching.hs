{-# LANGUAGE OverloadedStrings #-}

--import System.IO --allows to read and write files
import System.Environment
import System.Random
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

-- TESTING WITH BYTESTRING
sampleBytes :: B.ByteString
sampleBytes = "Hello!"

sampleString :: String
--sampleString = B.unpack sampleBytes -- would throw an error as B.unpack -> Data.ByteString.Char8
sampleString = BC.unpack sampleBytes

bcInt :: BC.ByteString
bcInt = "6"

bcToInt :: BC.ByteString -> Int
bcToInt = read . BC.unpack

-- GLITCHING 
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
  
main :: IO ()
main = do
  putStrLn "Testing with bytestring\n-------------------------"
  print (sampleBytes)
  print (sampleString)
  print (bcInt)
  print (bcToInt bcInt)
  --
  putStrLn "----------\nGlitching\n----------"
  args <-  getArgs -- :set args art.jpg
  let fileName = head args
  --
  imageFile <- BC.readFile fileName
  glitched <- randomReplaceByte imageFile
  --
  let glitchedFileName = mconcat ["glitched_", fileName]
  BC.writeFile glitchedFileName glitched
  putStrLn ">> Glitching is done."