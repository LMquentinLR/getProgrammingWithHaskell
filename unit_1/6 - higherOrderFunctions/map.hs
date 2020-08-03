mreverse = map reverse
mhead = map head
mtake4 = map (take 4)
mAddAnA = map ("a "++)

addAnA [] = []
addAnA (x:xs) = ("a " ++ x):addAnA xs

myMap f [] = []
myMap f (x:xs) = (f x):myMap f xs

main = do
  let list1 = ["dog","cat","moose"]
  let list2 = ["pumpkin","pie","peanut butter"]
  print(mreverse list1)
  print(mhead list1)
  print(mtake4 list2)
  print(mAddAnA (list1 ++ list2))
  print(mAddAnA [])
  print(addAnA (list1 ++ list2))
  print(myMap ("a "++) (list1 ++ list2))