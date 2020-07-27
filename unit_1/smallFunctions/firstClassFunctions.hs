ifEven myFunc x = 
  if even x
  then myFunc x
  else x
  
inc n = n+1
double n = n*2
square n = n^2

main = do
  let myList = [1..10]
  print (map (ifEven inc) myList)
  print (map (ifEven double) myList)
  print (map (ifEven square) myList)