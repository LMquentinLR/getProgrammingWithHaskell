-- version 1
getRequestURL_1 host apiKey resource id =
  host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

genHostRequestBuilder host = (\apiKey resource id -> 
                               getRequestURL_1 host apiKey resource id)

genApiRequestBuilder hostBuilder apiKey = (\resource id ->
                                            hostBuilder apiKey resource id)

genApiRequestBuilder_2 hostBuilder apiKey resource = (\id ->
                                                        hostBuilder apiKey resource id)
main = do
  let exampleUrlBuilder = genHostRequestBuilder "http://example.com"
  let myExampleUrlBuilder = genApiRequestBuilder exampleUrlBuilder "1337hAsk3ll"
  let mySecondExampleUrlBuilder = genApiRequestBuilder_2 exampleUrlBuilder "1337hAsk3ll" "book"
  
  print(exampleUrlBuilder "1337hAsk3ll" "book" "1234")
  print(myExampleUrlBuilder "book" "1234")
  print(mySecondExampleUrlBuilder "1234")
  