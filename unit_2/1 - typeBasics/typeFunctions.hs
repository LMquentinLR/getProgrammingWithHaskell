makeAddress :: Int -> String -> String -> (Int, String, String)
makeAddress number street town = (number, street, town)

makeAddress2 :: a -> b -> b -> (a, b, b)
makeAddress2 number street town = (number, street, town)

makeAddressLambda = (\number ->
                      (\street -> 
                        (\town -> (number, street, town))))

ifEven :: (Int -> Int) -> Int -> Int
ifEven f n = if even n
             then f n
             else n

double :: Int -> Int
double n = n*2   
  
main = do
  let x = 4
  let y = "Privet Drive"
  let z = "London"
  print (makeAddress x y z)
  print (makeAddress2 x y z)
  print (makeAddressLambda x y z)
  print(ifEven double x)
  print(map (ifEven double) [1,2,3,4])