cup fl0z = \_ -> fl0z --constant
cup2 fl0z = \message -> message fl0z
get0z aCup = aCup (\fl0z -> fl0z)

drink aCup ozDrank = cup (fl0z - ozDrank)
  where fl0z = get0z aCup

newDrink aCup ozDrank = if ozDiff >=0
                        then cup ozDiff
                        else cup 0
  where fl0z = get0z aCup
        ozDiff = fl0z - ozDrank

isEmpty aCup = get0z aCup == 0
        
main = do
  let firstCup = cup 6
  let secondCup = cup2 12
  print(get0z firstCup)
  print(get0z secondCup)
  --
  let afterASip = drink firstCup 1
  print(get0z afterASip)
  let afterTwoSip = drink afterASip 1
  print(get0z afterTwoSip)
  let afterGulp = drink afterTwoSip $ get0z afterTwoSip
  print(get0z afterGulp)
  --testNegative -> Doesn't work
  --let bigSip = drink secondCup 13
  --print(bigSip)
  --let barf = drink bigSip $ get0z bigSip
  -- -> needs new drink function
  -- Doesn't work in GHC but does in GHCI
  -- No instance for (Show (p0 -> a0)) arising from a use of `print'
  --let afterBigGulp = newDrink secondCup 20
  --print(afterBigGulp)
  --
  print(isEmpty afterGulp)
  -- Doesn't work in GHC but does in GHCI
  -- Ambiguous type variable `p0' arising from a use of `drink'
  --print(foldl drink secondCup [1,1,1,1,1])