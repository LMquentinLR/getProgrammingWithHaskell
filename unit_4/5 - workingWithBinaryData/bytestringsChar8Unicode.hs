{-# LANGUAGE OverloadedStrings #-}

--import System.IO --allows to read and write files
import System.Environment
import System.Random
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.Text as T 
import qualified Data.Text.IO as TIO
import qualified Data.Text.Encoding as E

nagarjunaBC :: BC.ByteString
nagarjunaBC = "नागार्जुन"

nagarjunaText :: T.Text
nagarjunaText = "नागार्जुन"

nagarjunaBC2 :: BC.ByteString
nagarjunaBC2 = (BC.pack . T.unpack) nagarjunaText

nagarjunaSafe :: B.ByteString
nagarjunaSafe = E.encodeUtf8 nagarjunaText

main :: IO ()
main = do
  print nagarjunaBC
  TIO.putStrLn ((T.pack . BC.unpack) nagarjunaBC2)
  TIO.putStrLn (E.decodeUtf8 nagarjunaSafe) -- need to force unicode in the command prompt > chcp 650001