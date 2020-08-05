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

data Patient = Patient Name Sex Age Height Weight BloodType

----- from definingType.hs
sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"

showName :: Name -> String
showName (Name a b) = a ++ " " ++ b

--showAge :: Age -> Int
--showAge a = a

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False --otherwise
-----

getName :: Patient -> Name
getName (Patient n _ _ _ _ _) = n

getAge :: Patient -> Age
getAge (Patient _ _ a _ _ _) = a

getBloodType :: Patient -> BloodType
getBloodType (Patient _ _ _ _ _ bt) = bt

main = do
  let johnDoe = Patient (Name "John" "Doe") Male 30 764  200 (BloodType AB Pos)
  print (showName $ getName johnDoe)
  print (getAge johnDoe)
  print (showBloodType $ getBloodType johnDoe)
  
  