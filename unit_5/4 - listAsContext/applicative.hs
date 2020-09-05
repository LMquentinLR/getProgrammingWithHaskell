main :: IO ()
main = do
  print ((*) <$> Just 6 <*> Just 7) -- Just 42
  print (div <$> Just 6 <*> Just 7) -- Just 0
  print (mod <$> Just 6 <*> Just 7) -- Just 6
  print ((++) <$> Just "This is " <*> Just "a test.")
  print (pure 6 :: Maybe Int)
  print ((6+) <$> Just 5)
  print (pure (6+) <*> Just 5)
  (pure "Hello World" :: IO String) >>= putStrLn :: IO ()