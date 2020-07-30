myLength [] = 0
myLength x = 1 + myLength (tail x)

myLength2 [] = 0
myLength2 (_:xs) = 1 + myLength2 xs

myTake _ [] = []
myTake 0 _ = []
myTake n (x:xs) = x:rest
  where rest = myTake (n-1) xs

main = do
  print(myLength [1,2,3,4,5])
  print(myLength2 [1,2,3,4,5])
  print(myTake 0 [1,2,3,4,5])
  print(myTake 3 [1,2,3,4,5])
  print(myTake 7 [1,2,3,4,5])
  print((myTake 23 []) :: [()])
  print(myTake 23 ([] :: [()]))
  print(myTake 23 []::[Integer])

--GHCi will do this for us. But GHC won't. To print a value of type a, there must be an instance of the Show type class for that type a
--There is only an instance of Show for [x] (the type of lists of values of type x) if there is also an instance of Show for x
--You wrote print [] essentially, and the type of [] is [] :: [y] GHC doesn't know what type of elements you want that list to have, 
--and it needs to know how to Show values of that type. Before it can Show the whole list. The fact that there are no elements inside 
--the list is not useful. It is useful to GHCi; GHCi is more willing to "default" polymorphic types

--myTake 0 [1,2,3,4,5] has the type Num a => [a] Actually (Num a, Show a) => [a] because you're printing it And GHC is willing to pick a
--default type for a in this circumstance. Namely Integer. So you have an "empty list of integers". There is a Show instance for Integer 
--and so there's a Show instance for [Integer] (the type of lists of integers)

--This is only because there's a Num constraint
--That's the only reason GHC is willing to guess Integer
--GHCi is willing to make more guesses. If it needs to take the type Show a => [a] and make it into a concrete type, it will choose a to be ()
--So print [] is (the same as) print ([] :: [()]). If you write print ([] :: [()]) in your code, GHC and GHCi will both run it just fine
--Or print (myTake 23 ([] :: [()])). Or print ((myTake 23 []) :: [()]), which is also written print (myTake 23 [] :: [()])