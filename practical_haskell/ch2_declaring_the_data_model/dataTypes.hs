type Name = String
type Surname = String
type Id = Integer
type Contact = String
type Position = String
type AdAccept = Bool

-- TYPES

data Client = GovOrg     Name
            | Company    Name Id Person Position
            | Individual Person AdAccept 
            deriving Show

data Person = Person Name Surname Gender 
            deriving Show

data Gender = Male | Female | Unknown 
            deriving Show 

data ClientR = GovOrgR { clientRName  :: String }
             | CompanyR { clientRName :: String
                        , companyId   :: Integer
                        , person      :: PersonR
                        , duty        :: String } 
             | IndividualR { person   :: PersonR } 
             deriving Show

data PersonR = PersonR { firstName :: String
                       , lastName  :: String
                       } deriving Show


-- FUNCTIONS

clientName :: Client -> String
clientName client = case client of
                      GovOrg name           -> name
                      Company name _ _ _    -> name
                      Individual (Person fNm lNm _) _ -> fNm ++ " " ++ lNm

companyName :: Client -> String -- throws a warning for non-exhaustive patterns in case
companyName client = case client of
                       Company name _ _ _ -> name

maybeCompName :: Client -> Maybe String
maybeCompName client = case client of
                         Company name _ _ _ -> Just name
                         _                  -> Nothing

main :: IO ()
main = do
  print "-- ALL LOADED --"
  print $ GovOrg "Nasa"
  print $ Individual (Person "Jack" "Smith" Male) True
  print $ clientName (Individual (Person "Jack" "Smith" Male) False)
  print $ clientName (Company "Nasa" 13 (Person "Niel" "Amstrong" Male) "Astronaut")
  print $ maybeCompName (Company "Nasa" 13 (Person "Niel" "Amstrong" Male) "Astronaut")
  print $ maybeCompName (GovOrg "Nasa")
