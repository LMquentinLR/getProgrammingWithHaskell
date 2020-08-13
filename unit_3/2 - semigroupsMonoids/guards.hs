howMuch :: Int -> String
howMuch n | n > 10 = "A whole bunch"
          | n > 0 = "Not much"
          | otherwise = "We're in debt!"

main = do
  print(map howMuch [-5, -2 .. 20])