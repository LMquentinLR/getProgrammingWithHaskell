import Data.Char
import Data.Ratio

main :: IO ()
main = do
  print $ chr 97
  print $ toUpper $ chr 97
  print $ 1 % 2 + 1 % 3
  print $ toRational 1.3
  print $ toRational (fromRational (13 % 10)) 
  -- perfect round-tripping between rational and float values is not always possible
  let x = [1,2,3,4,5]
  let y = "Hello World!"
  print x
  print $ reverse x
  print y
  print $ reverse y
  print $ x ++ [6,7,8]
  print $ head x
  print $ init x
  print $ tail x
  print $ last x
  print $ null []
  print $ null x
  print $ (True && False) || (False && not False)
  print $ or [True, False, and [False, True, True]]
  print $ (2 == 2.1) || (2 < 2.1) || (2 > 2.1)
  print $ 4.000000000000000003-4==0
