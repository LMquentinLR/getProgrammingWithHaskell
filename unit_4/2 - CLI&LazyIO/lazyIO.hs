import System.IO

main :: IO ()
main = do
  user <- getContents
  --mapM_ print user
  let reversed = reverse user
  putStr reversed