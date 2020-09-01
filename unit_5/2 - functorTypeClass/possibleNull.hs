successfulRequest :: Maybe Int
successfulRequest = Just 6

failedRequest :: Maybe Int
failedRequest = Nothing

successStr :: Maybe String
successStr = show <$> successfulRequest

failedStr :: Maybe String
failedStr = show <$> failedRequest

testSuccessStr :: Maybe String
testSuccessStr = Just "Testing skit"

testFailedStr :: Maybe String
testFailedStr = Nothing

incMaybe :: Maybe Int -> Maybe Int -- does not scale very well
incMaybe (Just n) = Just (n+1)
incMaybe Nothing = Nothing

main = do
  print (incMaybe successfulRequest)
  print (incMaybe failedRequest)
  print (fmap (+1) successfulRequest)
  print (fmap (+1) failedRequest)
  print ((+1) <$> successfulRequest)
  print ((+1) <$> failedRequest)
  print (reverse <$> testSuccessStr)
  print (fmap reverse testSuccessStr)
  print (reverse <$> testFailedStr)
  print (fmap reverse testFailedStr)