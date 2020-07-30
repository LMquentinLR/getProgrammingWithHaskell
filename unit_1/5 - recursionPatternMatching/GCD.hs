myGCD a b = if remainder == 0
            then b
            else myGCD b remainder
  where remainder = a`mod` b

sayAmount n = case n of
  1 -> "one"
  2 -> "two"
  n -> "a bunch"
  
main = do
  print(myGCD 20 16)
  print(myGCD 5 7)
  print(map sayAmount [1,2,3,4,5])