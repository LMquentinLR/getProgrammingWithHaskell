data Sex = Male | Female

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType
--data TestBT = ABOType RhType

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

--showBT2 :: TestBT -> String
--showBT2 abo rh = showABO abo ++ showRh rh

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False --otherwise

main = do
  let masc = Male
  let patient1BT = BloodType A Pos
  let patient2BT = BloodType O Neg
  let patient3BT = BloodType AB Pos
  --let testPatient  = AB Pos
  --
  print(sexInitial masc)
  print(map showBloodType [patient1BT, patient2BT, patient3BT])
  --print(testPatient)
  print(canDonateTo patient1BT patient2BT)
  print(canDonateTo patient3BT patient1BT)
  print(canDonateTo patient2BT patient1BT)