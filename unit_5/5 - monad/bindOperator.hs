import qualified Data.Map as Map

type UserName = String

type GamerId = Int
type WillCoId = Int
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

gamerIdDB :: Map.Map WillCoId GamerId
gamerIdDB = Map.fromList [ (1001, 1)
                         , (1002, 2)
                         , (1003, 3)
                         , (1004, 4)
                         , (1005, 5)
                         , (1006, 6) ]

-- we want creditsFromId :: GamerId -> Maybe PlayerCredits
-- full type: Maybe UserName -> (UserName -> Maybe PlayerCredits) -> Maybe PlayerCredits

lookupUserName :: GamerId -> Maybe UserName
lookupUserName id = Map.lookup id userNameDB

lookupCredits :: UserName -> Maybe PlayerCredits
lookupCredits username = Map.lookup username creditsDB

lookupGamerId :: WillCoId -> Maybe GamerId
lookupGamerId id = Map.lookup id gamerIdDB

creditsFromId :: GamerId -> Maybe PlayerCredits
creditsFromId id = lookupUserName id >>= lookupCredits

creditsFromWCId :: WillCoId -> Maybe PlayerCredits
creditsFromWCId id = lookupGamerId id >>= lookupUserName >>= lookupCredits

main = do
  print (creditsFromId 2)
  print (creditsFromWCId 1001)
  print (creditsFromWCId 100)
  