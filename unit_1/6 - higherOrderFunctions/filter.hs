fEven = filter even
fStartsA = filter (\(x:xs) -> x == 'b')

remove test [] = []
remove test (x:xs) = if test x
                     then remove test xs
                     else x:remove test xs

rcons x y = y:x
myReverse xs = foldl rcons [] xs
                     
main = do
  let list1 = [1,2,3,4]
  let list2 = ["pumpkin","pie","peanut butter","banana"]
  print(fEven list1)
  print(fStartsA list2)
  print(remove even list1)
  print(foldl (+) 0 list1)
  print(foldl (*) 1 list1)
  print(myReverse list1)