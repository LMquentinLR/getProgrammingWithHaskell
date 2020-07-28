add4 a b c d = a + b + c + d

addXto3 x = (\b c d ->
              add4 x b c d)

addXYto2 x y = (\c d ->
                 add4 x y c d)

main = do
  let mystery = add4 3
  print(mystery 2 3 4)
  print(mystery 5 6 7)
  
  let anotherMystery = add4 2 3
  print(anotherMystery 1 2)
  print(anotherMystery 4 5)