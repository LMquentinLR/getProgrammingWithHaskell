module Main where

-- IMPORT LIBRARIES

import qualified Data.ByteString            as B
import qualified Data.ByteString.Char8      as BC
import qualified Data.ByteString.Lazy       as L
import qualified Data.ByteString.Lazy.Char8 as LC
import           Network.HTTP.Simple

-- VARIABLES

myToken :: BC.ByteString
myToken = "<API TOKEN HERE>"

noaaHost :: BC.ByteString
noaaHost = "www.ncdc.noaa.gov"

apiPath :: BC.ByteString
apiPath = "/cdo-web/api/v2/datasets"

--response = httpLBS "http://news.ycombinator.com"

request :: Request
request = buildRequest myToken noaaHost "GET" apiPath

-- FUNCTIONS

buildRequest :: BC.ByteString -> BC.ByteString -> BC.ByteString -> BC.ByteString -> Request
buildRequest token host method path = 
  let state1 = setRequestPort 443 defaultRequest
  in let state2 = setRequestSecure True state1
    in let state3 = setRequestPath path state2
      in let state4 = setRequestHeader "token" [token] state3
        in setRequestHost host state4

buildRequest2 :: BC.ByteString -> BC.ByteString -> BC.ByteString -> BC.ByteString -> Request
buildRequest2 token host method path = setRequestMethod method
                                     $ setRequestHost host
                                     $ setRequestHeader "token" [token] 
                                     $ setRequestPath path 
                                     $ setRequestSecure True 
                                     $ setRequestPort 443 
                                     $ defaultRequest

main :: IO ()
main = do
  response <- httpLBS request
  let status = getResponseStatusCode response
  if status == 200
  then do
    print "Saving request to file"
    let jsonBody = getResponseBody response
    L.writeFile "data.json" jsonBody
  else print "request failed with error"
