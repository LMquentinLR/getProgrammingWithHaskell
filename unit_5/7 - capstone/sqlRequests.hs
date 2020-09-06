import Control.Monad

------ TYPES
data Name = Name 
            { firstName :: String
            , lastName  :: String }
instance Show Name where
  show (Name first last) = mconcat [first, " ", last]
  
data GradeLevel = Freshman 
                | Sophomore 
                | Junior 
                | Senior deriving (Eq, Ord, Enum, Show)

data Student = Student
               { studentId   :: Int
               , gradeLevel  :: GradeLevel
               , studentName :: Name } deriving Show

data Teacher = Teacher
               { teacherId  :: Int
               , teacherName :: Name } deriving Show
              
data Course = Course
              { coursedId   :: Int
              , courseTitle :: String
              , teacher     :: Int } deriving Show

------ STATEMENTS               
students :: [Student]
students = [ (Student 1 Senior (Name "Audre" "Lorde"))
           , (Student 2 Junior (Name "Leslie" "Silko"))
           , (Student 3 Freshman (Name "Judith" "Butler"))
           , (Student 4 Senior (Name "Guy" "Debord"))
           , (Student 5 Sophomore (Name "Jean" "Baudrillard"))
           , (Student 6 Junior (Name "Julia" "Kristeva")) ]

teachers :: [Teacher]
teachers = [ Teacher 100 (Name "Simone" "De Beauvoir")
           , Teacher 200 (Name "Susan" "Sontag") ]
           
courses :: [Course]
courses = [ Course 101 "French" 100
          , Course 201 "English" 200 ]

joinData = (_join teachers courses teacherId teacher)

whereResult = _where ((=="English") . courseTitle . snd) joinData

selectResult = _select (teacherName . fst) whereResult  
        
------ FUNCTIONS

startsWith :: Char -> String -> Bool
startsWith char string = char == (head string)

_select :: (a-> b) -> [a] -> [b]
_select prop vals = do
  val <- vals
  return (prop val)

_where :: (a -> Bool) -> [a] -> [a]
_where test vals = do
  val <- vals
  guard (test val)
  return val

_join :: Eq c => [a] -> [b] -> (a->c) -> (b->c) -> [(a,b)]
_join data1 data2 prop1 prop2 = do
  d1 <- data1
  d2 <- data2
  let dpairs = (d1, d2)
  guard ((prop1 (fst dpairs)) == (prop2 (snd dpairs)))
  return dpairs

_hinq selectQuery joinQuery whereQuery = (\joinData -> 
                                          (\whereResult -> selectQuery whereResult) 
                                          (whereQuery joinData)
                                         ) joinQuery

finalResult :: [Name]
finalResult = _hinq (_select (teacherName . fst))
                    (_join teachers courses teacherId teacher)
                    (_where ((=="English") . courseTitle . snd))
                    
teacherFirstName :: [String]
teacherFirstName = _hinq (_select firstName)
                         finalResult
                         (_where (\_ -> True))
                        
------ MAIN
main :: IO ()
main = do
  -- testing _select
  print (_select (firstName . studentName) students)
  print (_select (gradeLevel) students)
  print (_select (\x -> (studentName x, gradeLevel x)) students)
  -- testing _where
  print (_where (startsWith 'J' . firstName) (_select studentName students))
  -- testing _join
  print (_join teachers courses teacherId teacher)
  -- testing variables
  print ("------------")
  print joinData
  print whereResult
  print selectResult
  print (finalResult)
  print (teacherFirstName)