ifEven myFunc x = 
  if even x
  then myFunc x
  else x

inc n = n+1
  
genIfEven f = (\x -> ifEven f x)

genIfXEven x = (\f -> ifEven f x)

main = do
  let genIncEven = genIfEven inc
  let genIf2Even = genIfXEven 2
  print (genIncEven 2)
  print(genIf2Even inc)