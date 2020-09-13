import           Data.Array.Unboxed

aLargeList :: [Int]
aLargeList = [1 .. 10000000]

aLargeArray :: UArray Int Int
aLargeArray = array (0,9999999) []

aLargeListDoubled :: [Int]
aLargeListDoubled = map (*2) aLargeList

zeroIndexArray :: UArray Int Bool
zeroIndexArray = array (0,9) [(3,True)]

oneIndexArray :: UArray Int Bool
oneIndexArray = array (1,10) $ zip [1 .. 10] $ cycle [True]

exArray :: UArray Int Bool
exArray = array (0,5) [(0,True), (2,True)]

beansInBuckets :: UArray Int Int
beansInBuckets = array (0,3) $ zip [0 .. 3] $ cycle [0]

updatedBiB :: UArray Int Int
updatedBiB = beansInBuckets // [(1,5),(3,6)]

main :: IO ()
main = do
  print $ oneIndexArray ! 1
  print $ oneIndexArray ! 3
  print $ zeroIndexArray ! 5
  print $ zeroIndexArray ! 3
  print beansInBuckets
  print $ beansInBuckets // [(1,5),(3,6)]
  print beansInBuckets
  print $ updatedBiB
  print $ accum (+) updatedBiB $ zip [0 .. 3] $ cycle [2]
