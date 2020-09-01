maybeInc :: Maybe (Integer -> Integer)
maybeInc = (+) <$> Just 1

val1 :: Maybe Int
val1 = Just 10

val2 :: Maybe Int
val2 = Just 5

main = do
  print (maybeInc <*> Just 5)
  print (maybeInc <*> Nothing)
  print (maybeInc <*> Just 100)
  --
  print((++) <$> Just "cats" <*> Just " and dogs")
  print((++) <$> Nothing <*> Just " and dogs")
  print((++) <$> Just "cats" <*> Nothing)
  --
  print((+) <$> val1 <*> val2)
  print(div <$> val1 <*> val2)
  print(mod <$> val1 <*> val2)