main = do
  print(head [1,2,3])
  print(head [[1,2],[3,4],[5,6]])
  print(tail [1,2,3])
  print(tail [3])
  print(1:[])
  print(1:2:3:4:[])
  print((1,2):(3,4):(5,6):[])
  print(1:[2,3,4])
  print(['h','e','l','l','o'])
  print('h':'e':'l':'l':'o':[])
  print('h':"ello")
  -- print("h":"ello") will fail
  -- print(['h']:['e','l','l','o']) will fail
  -- print('h':[]:'e':'l':'l':'o':[]) will fail
  print("h"++"ello")
  print([1]++[2,3,4])
  --
  --
  --
  let x = [1 .. 10]
  let y = [1,3 .. 10]
  let z = [1,1.5 .. 5]
  let a = [1,0 .. -10]
  print(x)
  print(y)
  print(z)
  print(a)
  
  print([1,2,3] !! 0)
  print("puppies" !! 4)
  -- print([1 .. 10]  !! 11) will fail
  let b = (!!) [1,2,3] 0
  print(b)