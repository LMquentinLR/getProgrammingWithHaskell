paExample1 = (!!) "dog"
paExample2 = ("dog" !!)

isPalindrome word = word == reverse word

respond phrase = if '!' `elem` phrase 
                 then "wow!"
                 else "uh.. okay"

takeLast n aList = reverse(take n(reverse aList))

ones n = take n (cycle [1,-1])

assignToGroups n aList = zip groups aList
  where groups = cycle [1 .. n]

main = do
  print(paExample1 2)
  print(paExample2 2)
  print(length [1..20])
  print(length [(10,20),(1,2),(15,16)])
  print(length "quicksand")
  print(reverse [1,2,3])
  print(reverse "cheese")
  print(map isPalindrome ["cheese", "racecar"])
  print(elem 55 [1..100])
  print(elem 'p' "cheese")
  print(respond "hello")
  print(respond "hello!")
  print(take 10 [1, 100 .. 10000000000000])
  print(take 10 [0, 100 .. 10000000000000])
  print(takeLast 10 [1..100])
  print(drop 2 [1,2,3,4,5,6,7])
  print(zip [1,2,3] [2,3,4])
  print(zip "dog" "rabbit")
  print(zip [1..] ['a' .. 'z'])
  print(ones 5)
  print(ones 2)
  print(assignToGroups 3 [ "file1.txt"
                          ,"file2.txt"
                          ,"file3.txt"
                          ,"file4.txt"
                          ,"file5.txt"]
       )