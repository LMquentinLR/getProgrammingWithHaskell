{-# LANGUAGE OverloadedStrings #-}

import System.IO --allows to read and write files
import System.Environment -- get args
import qualified Data.Text as T
import qualified Data.Text.IO as TI


--type FilePath = String
--data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
--openFile :: FilePath -> IOMode -> IO Handle

--readFile :: FilePath -> IO String
--writeFile :: FilePath -> String -> IO ()
--appendFile :: FilePath -> String -> IO ()

getCounts :: T.Text -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount)
  where charCount = T.length input
        wordCount = (length . T.words) input
        lineCount = (length . T.lines) input

countsText :: (Int, Int, Int) -> T.Text
countsText (cc, wc, lc) = T.pack (unwords [ "chars: "
                                          , show cc
                                          , ", words: "
                                          , show wc
                                          , ", lines: "
                                          , show lc])
-- GHCi> (countsText . getCounts) "this is\n some text"

main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  input <- TI.readFile fileName
  let summary = (countsText . getCounts) input
  TI.appendFile "stats.dat" (mconcat [ (T.pack fileName)
                                     , " "
                                     , summary
                                     , "\n"])
  TI.putStrLn summary