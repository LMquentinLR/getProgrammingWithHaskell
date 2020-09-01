import qualified Data.Map as Map
import Data.Maybe

type LatLong = (Double, Double)

locationDB :: Map.Map String LatLong
locationDB = Map.fromList [ ("Arkham", (42.6054, -70.7829))
                          , ("Innsmouth", (42.8250, -70.8150))
                          , ("Carcosa", (29.9714, -90.7694))
                          , ("New York", (40.7776, -73.9691)) ]
 
toRadians :: Double -> Double
toRadians degrees = degrees * pi /180

latLongToRads :: LatLong -> (Double, Double)
latLongToRads (lat, long) = (rLat, rLong)
  where rLat = toRadians lat
        rLong = toRadians long

haversine :: LatLong -> LatLong -> Double
haversine coords1 coords2 = earthRadius * c
  where (rLat1, rLong1) = latLongToRads coords1
        (rLat2, rLong2) = latLongToRads coords2
        dLat = rLat2 - rLat1
        dLong = rLong2 - rLong1
        a = (sin (dLat/2))^2 + cos rLat1 * cos rLat2 * (sin (dLong/2))^2
        c = 2 * atan2 (sqrt a) (sqrt (1-a))
        earthRadius = 3961.0
        
haversineMaybe :: Maybe LatLong -> Maybe LatLong -> Maybe Double
haversineMaybe Nothing _ = Nothing
haversineMaybe _ Nothing = Nothing
haversineMaybe (Just val1) (Just val2) = Just (haversine val1 val2)

printDistance :: Maybe Double -> IO ()
printDistance Nothing = putStrLn "Error, invalid city entered"
printDistance (Just distance) = putStrLn (show distance ++ " miles")

main :: IO ()
main = do
  print (haversine (40.7776, -73.9691) (42.6054, -70.7829))
  print (haversine (fromJust $ Map.lookup "New York" locationDB) (fromJust $ Map.lookup "Arkham" locationDB))
  printDistance (haversineMaybe (Map.lookup "New York" locationDB) (Map.lookup "Arkham" locationDB))
  --- WITH APPLICATIVES
  let start = Map.lookup "Carcosa" locationDB
  let end = Map.lookup "Innsmouth" locationDB
  print (haversine <$> start <*> end)
  -- IO ()
  putStrLn "Enter the starting city name:"
  startingInput <- getLine
  let startCity = Map.lookup startingInput locationDB
  putStrLn "Enter the end city name:"
  endingInput <- getLine
  let endCity = Map.lookup endingInput locationDB
  let distance = haversine <$> startCity <*> endCity
  printDistance distance