type Name = String
type Surname = String
type Id = Integer
type Contact = String
type Position = String
type AdAccept = Bool

-- TYPES
data Triple a b c = Triple a b c deriving Show

data SamePair a = SamePair a a deriving Show

data Client i = GovOrg {clientId  :: i
                     , clientName :: String }
             | Company { clientId   :: i
                       , clientName :: String
                       , person     :: Person
                       , duty       :: String }
             | Individual { clientId :: i
                          , person   :: Person }
             deriving (Show, Eq, Ord)

data Person = Person { firstName :: String
                      , lastName :: String
                      } deriving (Show, Eq, Ord)

-- FUNCTIONS
swapTriple :: Triple a b c -> Triple c b a
swapTriple (Triple a b c) = Triple c b a

duplicate :: a -> SamePair a
duplicate a = SamePair a a

main :: IO ()
main = do
  print "-- ALL LOADED --"
  print $ GovOrg 'n' "NTTF"
  let x = duplicate 1
  let y = SamePair 1 2
  let z = SamePair 1 2 :: SamePair Int
  print x
  print y
  print z
  
