folr :: (a -> b -> b) -> b -> [a] -> b
foldr f initial [] = initial
foldr f initial (x:xs) = f x (foldr f initial xs)

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl _ initial [] = initial
foldlf initial (x:xs) = foldl f (f initial x) xs

Main :: IO ()
main = do
  print "-- ALL LOADED --"
