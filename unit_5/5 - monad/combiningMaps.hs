import qualified Data.Map as Map

type UserName = String
type GamerId = Int
type PlayerCredits = Int

userNameDB :: Map.Map GamerId UserName
userNameDB = Map.fromList [ (1, "nYarlathoTep")
                          , (2, "KINGinYELLOW")
                          , (3, "dagon1997")
                          , (4, "rcarter1919")
                          , (5, "xCTHULHUx")
                          , (6, "yogSOThoth") ]
                          
creditsDB :: Map.Map UserName PlayerCredits
creditsDB = Map.fromList [ ("nYarlathoTep", 2000)
                         , ("KINGinYELLOW", 15000)
                         , ("dagon1997", 300)
                         , ("rcarter1919", 12)
                         , ("xCTHULHUx", 50000)
                         , ("yogSOThoth", 150000) ]

-- we want creditsFromId :: GamerId -> Maybe PlayerCredits
-- full type: Maybe UserName -> (UserName -> Maybe PlayerCredits) -> Maybe PlayerCredits

lookupUserName :: GamerId -> Maybe UserName
lookupUserName id = Map.lookup id userNameDB

lookupCredits :: UserName -> Maybe PlayerCredits
lookupCredits username = Map.lookup username creditsDB

-- WRAPPER FUNCTION TO AVOID USING FUNCTORS OR APPLICATIVES

altLookupCredit :: Maybe UserName -> Maybe PlayerCredits
altLookupCredit Nothing = Nothing
altLookupCredit (Just username) = lookupCredits username

creditsFromId :: GamerId -> Maybe PlayerCredits
creditsFromId id = altLookupCredit (lookupUserName id)

main = do
  print (creditsFromId 1)
  print (creditsFromId 100)