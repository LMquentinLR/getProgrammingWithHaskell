import qualified Data.Map as Map

-------------------------------------------------

data Grade = F | D | C | B | A deriving (Eq, Ord, Enum, Show, Read)

data Degree = HS | BA | MS | PhD deriving (Eq, Ord, Enum, Show, Read)

data Candidate = Candidate 
   { candidateId :: Int
   , codeReview  :: Grade
   , cultureFit  :: Grade
   , education   :: Degree } deriving Show
   
testCandidate :: Candidate
testCandidate = Candidate
    { candidateId = 0
    , codeReview = A
    , cultureFit = A
    , education = PhD }

candidate1 :: Candidate
candidate1 = Candidate
    { candidateId = 1
    , codeReview = A
    , cultureFit = A
    , education = BA }
    
candidate2 :: Candidate
candidate2 = Candidate
    { candidateId = 2
    , codeReview = C
    , cultureFit = A
    , education = PhD }
    
candidate3 :: Candidate
candidate3 = Candidate
    { candidateId = 3
    , codeReview = A
    , cultureFit = B
    , education = MS }
  
candidateDB :: Map.Map Int Candidate
candidateDB = Map.fromList [ (0, testCandidate)
                           , (1, candidate1)
                           , (2, candidate2)
                           , (3, candidate3) ]
  
candidates :: [Candidate]
candidates = [ testCandidate
             , candidate1
             , candidate2
             , candidate3 ] 

-------------------------------------------------
             
viable :: Candidate -> Bool
viable candidate = all (==True) tests
  where passedCoding = codeReview candidate > B
        passedCultureFit = cultureFit candidate > C
        educationMin = education candidate >= MS
        tests = [ passedCoding
                , passedCultureFit
                , educationMin ]

-------------------------------------------------

readInt :: IO Int
readInt = getLine >>= (return . read)

readGrade :: IO Grade 
readGrade = getLine >>= (return . read)

readDegree :: IO Degree
readDegree = getLine >>= (return . read)

readCandidate :: IO Candidate
readCandidate = do 
  putStrLn "Enter id:"
  cId <- readInt
  putStrLn "Enter code grade:"
  codeGrade <- readGrade
  putStrLn "Enter culture fit grade:"
  cultureGrade <- readGrade
  putStrLn "Enter education:"
  degree <- readDegree
  return (Candidate { candidateId = cId
                    , codeReview = codeGrade
                    , cultureFit = cultureGrade
                    , education = degree })
       
assessCandidateIO :: IO String
assessCandidateIO = do
  candidate <- readCandidate 
  let passed = viable candidate
  let statement = if passed
                  then "passed"
                  else "failed"
  return statement
                  
assessCandidateMaybe :: Int -> Maybe String
assessCandidateMaybe cId = do
  candidate <- Map.lookup cId candidateDB
  let passed = viable candidate
  let statement = if passed
                  then "passed"
                  else "failed"
  return statement

assessCandidateList :: [Candidate] -> [String]
assessCandidateList candidates = do
  candidate <- candidates
  let passed = viable candidate
  let statement = if passed
                  then "passed"
                  else "failed"
  return statement

assessCandidates :: [Candidate] -> [String]
assessCandidates candidates = map (\x -> if x
                                         then "passed"
                                         else "failed") passed
  where passed = map viable candidates
  
-------------------------------------------------

assessInterviewee :: Monad m => m Candidate -> m String
assessInterviewee candidates = do
  candidate <- candidates
  let passed = viable candidate
  let statement = if passed
                  then "passed"
                  else "failed"
  return statement
  
-- assessInterviewee readCandidate
-- assessInterviewee candidates
-- assessInterviewee (Map.lookup 1 candidateDB)