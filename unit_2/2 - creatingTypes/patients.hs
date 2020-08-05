type FirstName = String
type LastName = String
type Age = Int
type Height = Int
type PatientName = (String, String)

firstName :: PatientName -> String
firstName patient = fst patient
lastName :: PatientName -> String
lastName patient = snd patient

--patientInfo :: String -> String -> Int -> Int -> String
patientInfo :: FirstName -> LastName -> Age -> Height -> String
patientInfo fname lname age height = name ++ " " ++ ageHeight
  where name = lname ++ ", " ++ fname
        ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

patientInfo2 :: PatientName -> Age -> Height -> String
patientInfo2 (fname, lname) age height = name ++ " " ++ ageHeight
  where name = lname ++ ", " ++ fname
        ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

main = do
  let testPatient1 = patientInfo "John" "Doe" 43 74
  let testPatient2 = patientInfo2 ("Jane", "Smith") 25 62
  print(testPatient1)
  print(testPatient2)