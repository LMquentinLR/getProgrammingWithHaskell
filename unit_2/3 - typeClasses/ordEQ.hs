import Data.List

data Test1 = AA | ZZ deriving (Eq, Ord)
data Test2 = ZZZ | AAA deriving (Eq, Ord)

data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 deriving (Prelude.Show, Ord, Eq)

data SixSidedDie2 = Si1 | Si2 | Si3 | Si4 | Si5 | Si6 deriving (Prelude.Show, Enum)

data Name = Name (String, String) deriving (Show, Eq)
instance Ord Name where
  compare (Name (f1, l1)) (Name (f2, l2)) = compare (l1, f1) (l2, f2)

names :: [Name]
names = [ Name ("Emil", "Cioran")
        , Name ("Eugene", "Thacker")
        , Name ("Friedrich", "Nietzsche") ]
  
main = do
  print([Si1 ..])
  print(sort names)