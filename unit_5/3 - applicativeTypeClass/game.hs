data User = User
  { name    :: String
  , gamerId :: Int
  , score   :: Int
  } deriving Show

serverUsername :: Maybe String
serverUsername = Just "Sue"

serverGamerId :: Maybe Int
serverGamerId = Just 1337

serverScore :: Maybe Int
serverScore = Just 9001

missingData :: Maybe Int
missingData = Nothing

readInt :: IO Int
readInt = read <$> getLine

main :: IO ()
main = do
  print (User <$> serverUsername <*> serverGamerId <*> serverScore)
  print (User <$> serverUsername <*> serverGamerId <*> missingData)
  putStrLn "Enter a username, gamerId and score:"
  user <- User <$> getLine <*> readInt <*> readInt
  print user
  print "Done"