calcChange owed given = 
    if change > 0
    then change
    else 0
  where change = given - owed

main = do
  let owed = 20
  let walletContent = 21
  print (calcChange owed walletContent)