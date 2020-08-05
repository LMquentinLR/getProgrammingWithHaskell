type FirstName = String
type LastName = String

type Age = Int
type Height = Int
type Weight = Int 

data Name = Name FirstName LastName
data Sex = Male | Female
data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

data Patient = Patient { name :: Name
                       , sex :: Sex
                       , age :: Age
                       , height :: Height
                       , weight :: Weight
                       , bloodType :: BloodType }

jackieSmith :: Patient
jackieSmith = Patient { name = Name "Jackie" "Smith"
                      , age = 43
                      , sex = Female
                      , height = 62
                      , weight = 115
                      , bloodType = BloodType O Neg }

jackieSmithUpdated = jackieSmith { age = 44 }

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

showName :: Name -> String
showName (Name a b) = a ++ " " ++ b

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"

main = do
  print $ height jackieSmith
  print $ showBloodType (bloodType jackieSmith)
  print $ showName (name jackieSmith)
  
  print $ age jackieSmithUpdated