sumSquareOrSquareSum x y = 
    if sumSquare > squareSum
    then sumSquare
    else squareSum
  where sumSquare = x^2+y^2
        squareSum = (x+y)^2

sumSorSquareS x y = (\sumSquare squareSum ->
                      if sumSquare > squareSum
                      then sumSquare
                      else squareSum) 
  (x^2 + y^2) 
  ((x+y)^2)

sumSorSquareS2 x y = let sumSquare = (x^2 + y^2)
                         squareSum = ((x+y)^2)
                     in
                      if sumSquare > squareSum
                      then sumSquare
                      else squareSum

main = do
  let x = 1
  let y = 2
  print (sumSquareOrSquareSum x y)
  print (sumSorSquareS x y)
  print(sumSorSquareS2 x y)
  -- doubleDouble x = dubs * 2
  -- where dubs = x*2
  print ((\x -> (x*2)*2) 4)