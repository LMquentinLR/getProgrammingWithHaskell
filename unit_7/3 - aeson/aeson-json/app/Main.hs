module Main where

-- IMPORTS

import           Control.Monad
import           Data.Aeson
import           Data.ByteString.Lazy       as B
import           Data.ByteString.Lazy.Char8 as BC
import           Data.Text                  as T
import           GHC.Generics

-- TYPES
data Book = Book
            { title  :: T.Text
            , author :: T.Text
            , year   :: Int
            } deriving (Show, Generic)
instance FromJSON Book
instance ToJSON Book

data ErrorMessage = ErrorMessage
                    { message   :: T.Text
                    , errorCode :: Int
                    } deriving Show
instance FromJSON ErrorMessage where
  parseJSON (Object v) =
    ErrorMessage <$> v .: "message"
                 <*> v .: "error"
instance ToJSON ErrorMessage where
  toJSON (ErrorMessage message errorCode) =
    object [ "message" .= message
           , "error"   .= errorCode ]

data NOAAResult = NOAAResult
                { uid          :: T.Text
                , mindate      :: T.Text
                , maxdate      :: T.Text
                , name         :: T.Text
                , datacoverage :: Int
                , resultId     :: T.Text
                } deriving Show
instance FromJSON NOAAResult where
  parseJSON (Object v) =
    NOAAResult <$> v .: "uid"
               <*> v .: "mindate"
               <*> v .: "maxdate"
               <*> v .: "name"
               <*> v .: "datacoverage"
               <*> v .: "id"

data ResultSet = ResultSet
               { offset :: Int
               , count  :: Int
               , limit  :: Int
               } deriving (Show, Generic)
instance FromJSON ResultSet

data Metadata = Metadata
              { resultset :: ResultSet
              } deriving (Show, Generic)
instance FromJSON Metadata

data NOAAResponse = NOAAResponse
                  { metadata :: Metadata
                  , results  :: [NOAAResult]
                  } deriving (Show, Generic)
instance FromJSON NOAAResponse

-- VARIABLES
myBook :: Book
myBook = Book { author = "Will Kurt"
              , title = "Learn Haskell"
              , year = 2017 }

myBookJSON :: BC.ByteString
myBookJSON = encode myBook

rawJSON :: BC.ByteString
rawJSON = "{\"author\":\"Emile Cioran\",\"title\":\"A Short History of Decay \",\"year\":1949}"

bookFromJSON :: Maybe Book
bookFromJSON = decode rawJSON

wrongJSON :: BC.ByteString
wrongJSON = "{\"writer\":\"Emil Cioran\",\"title\":\"A Short History of Decay\",\"year\"=1949}"

bookFromWrongJSON :: Maybe Book
bookFromWrongJSON = decode wrongJSON

eitherBookFromWrongJSON :: Either String Book
eitherBookFromWrongJSON = eitherDecode wrongJSON

sampleError :: BC.ByteString
sampleError = "{\"message\":\"oops!\",\"error\":123}"

exampleMessage :: Maybe T.Text
exampleMessage = Just "Oops"

exampleError :: Maybe Int
exampleError = Just 123

fullExampleError :: Maybe ErrorMessage
fullExampleError = ErrorMessage <$> exampleMessage <*> exampleError

sampleErrorMessage :: Maybe ErrorMessage
sampleErrorMessage = decode sampleError

anErrorMessage :: ErrorMessage
anErrorMessage = ErrorMessage "Everything is Okay" 0

anEncodedErrorMessage :: BC.ByteString
anEncodedErrorMessage = encode anErrorMessage

testNOAAJSON :: Maybe NOAAResponse
testNOAAJSON = decode "{\"metadata\":{\"resultset\":{\"offset\":1,\"count\":11,\"limit\":25}},\"results\":[{\"uid\":\"gov.noaa.ncdc:C00861\",\"mindate\":\"1763-01-01\",\"maxdate\":\"2020-09-10\",\"name\":\"DailySummaries\",\"datacoverage\":1,\"id\":\"GHCND\"},]}"

-- FUNCTIONS

printResults :: Maybe [NOAAResult] -> IO ()
printResults Nothing = print "error loading data."
printResults (Just results) = do
  forM_ results $ \result -> do
    let dataName = name result
    print dataName

-- MAIN

main :: IO ()
main = do
  jsonData <- B.readFile "data.json"
  --let noaaResponse = testNOAAJSON
  let noaaResponse = decode jsonData :: Maybe NOAAResponse
  let noaaResults = results <$> noaaResponse
  printResults noaaResults
  print $ "All Done!"
