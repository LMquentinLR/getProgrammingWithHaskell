robot (name, attack, hp) = \message -> message (name, attack, hp)

name (n, _, _) = n
attack (_, a, _) = a
hp (_, _, hp) = hp

getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

versus robot1 robot2 = (getName robot1) ++ " vs. " ++ (getName robot2)

setName aRobot newName = aRobot (\(n, a, h) -> robot (newName, a, h))
setAttack aRobot newAttack = aRobot (\(n, a, h) -> robot (n, newAttack, h))
setHP aRobot newHP = aRobot (\(n, a, h) -> robot (n, a, newHP))

printRobot aRobot = aRobot (\(n,a,h) -> n ++
                                        " attack:" ++ (show a) ++
                                        " hp:" ++ (show h))

damage aRobot attackDamage = aRobot (\(n, a, h) -> robot (n, a, h - attackDamage))

fight aRobot defender = damage defender attack
  where attack = if getHP aRobot > 10
                 then getAttack aRobot
                 else 0

main = do
  let killerRobot = robot ("kill3r", 25, 200)
  let bob = robot ("Bob", 10, 100)
  
  print(versus killerRobot bob)
  print(getAttack killerRobot)
  print(getHP killerRobot)
  
  let nicerRobot = setName killerRobot "kitty"
  let gentlerRobot = setAttack killerRobot 5
  let softerRobot = setHP killerRobot 50
  
  print(printRobot nicerRobot)
  print(printRobot gentlerRobot)
  print(printRobot softerRobot)
  
  print(printRobot killerRobot)
  let afterHit = damage killerRobot 90
  print(getHP afterHit)
  
  let gentleGiant = robot ("Mr. Friendly", 10, 300)
  print(versus killerRobot gentleGiant)
  let gentleGiantR1 = fight killerRobot gentleGiant
  let killerRobotR1 = fight gentleGiant killerRobot
  let gentleGiantR2 = fight killerRobotR1 gentleGiantR1
  let killerRobotR2 = fight gentleGiantR1 killerRobotR1
  let gentleGiantR3 = fight killerRobotR2 gentleGiantR2
  let killerRobotR3 = fight gentleGiantR2 killerRobotR2
  print(printRobot gentleGiantR3)
  print(printRobot killerRobotR3)
  
  let fastRobot = robot ("speedy", 15, 40)
  let slowRobot = robot ("slowpoke", 20, 30)
  print(versus fastRobot slowRobot)
  let fastRobotR1 = fight slowRobot fastRobot
  let slowRobotR1 = fight fastRobot slowRobot
  let fastRobotR2 = fight slowRobotR1 fastRobotR1
  let slowRobotR2 = fight fastRobotR1 slowRobotR1
  let fastRobotR3 = fight slowRobotR2 fastRobotR2
  let slowRobotR3 = fight fastRobotR2 slowRobotR2
  print(printRobot fastRobotR3)
  print(printRobot slowRobotR3)