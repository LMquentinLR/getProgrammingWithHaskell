main = do
  let simple = (+) 1
  let myList = [1..100]
  print (map simple myList)