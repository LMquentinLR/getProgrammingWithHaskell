{-# LANGUAGE LambdaCase #-}

sayHello :: [String] -> [String]
sayHello names = map (\name -> case name of
                               "Alejandro" -> "Hello, writer"
                               _           -> "Welcome, " ++ name
                     ) names

sayHello2 :: [String] -> [String]
sayHello2 names = map (\case "Alejandro" -> "Hello, writer"
                             name        -> "Welcome, " ++ name
                      ) names

equalTuples :: [(Integer,Integer)] -> [Bool]
equalTuples t = map (\(x,y) -> x == y) t

curry :: ((a,b) -> c) -> a -> b -> c
curry f = \x y -> f (x, y)

uncurry :: (a -> b -> c) -> (a,b) -> c
uncurry f = \(x,y) -> f x y

flip :: (a -> b -> c) -> (b -> a -> c)
flip f = \x y -> f y x

main :: IO ()
main = do
  let f x = x + 2
  let a = [1,2,3,4]
  let b = [(1,2),(2,2),(3,4),(5,5)]
  let names = ["Alejandro", "Me", "someone"]
  print $ succ 1
  print $ map succ a
  print $ map f a
  print $ map (\x -> x + 2) a
  print $ equalTuples b
  print $ sayHello names
  print $ sayHello2 names
