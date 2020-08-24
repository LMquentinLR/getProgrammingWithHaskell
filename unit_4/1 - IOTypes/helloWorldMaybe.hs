helloPerson :: String -> String
helloPerson name = "Hello " ++ name ++ "!"

maybeMain :: Maybe String
maybeMain = do
  let name = "Test"
  let statement = helloPerson name
  return statement