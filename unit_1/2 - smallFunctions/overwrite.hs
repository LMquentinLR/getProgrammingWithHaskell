overwrite x = (\x -> (\x -> (\x -> x) 4) 3) 2

main = do
  let y = 1
  print (overwrite y)
  print y