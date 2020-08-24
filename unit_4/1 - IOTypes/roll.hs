import System.Random -- no longer included in GHCi since v. 7.2.1
-- cabal update 
-- cabal install random
--
--
-- install: https://github.com/phadej/splitmix
-- install: https://github.com/haskell/random
-- download and unzip, on windows:
-- cd in folder
-- ghc Setup.hs
-- Setup.exe configure
-- Setup.exe build
-- Setup.exe install
-- for both
-- check ghci >> :m System.Random

minDie :: Int
minDie = 1

maxDie :: Int
maxDie = 6

main :: IO ()
main = do
  dieRoll <- randomRIO (minDie, maxDie)
  putStrLn (show dieRoll)
  