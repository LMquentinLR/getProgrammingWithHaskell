import System.IO --allows to read and write files
import System.Environment -- get args

--type FilePath = String
--data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
--openFile :: FilePath -> IOMode -> IO Handle

--readFile :: FilePath -> IO String
--writeFile :: FilePath -> String -> IO ()
--appendFile :: FilePath -> String -> IO ()

getCounts :: String -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount)
  where charCount = length input
        wordCount = (length . words) input
        lineCount = (length . lines) input

countsText :: (Int, Int, Int) -> String
countsText (cc, wc, lc) = unwords [ "chars: "
                                  , show cc
                                  , ", words: "
                                  , show wc
                                  , ", lines: "
                                  , show lc]
-- GHCi> (countsText . getCounts) "this is\n some text"

main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  file <- openFile fileName ReadMode
  input <- hGetContents file
  let summary = (countsText . getCounts) input
  putStrLn summary
  hClose file
  appendFile "stats.dat" (mconcat [ fileName
                                  , " "
                                  , summary
                                  , "\n"])