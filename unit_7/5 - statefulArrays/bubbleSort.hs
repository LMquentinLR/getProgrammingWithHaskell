import           Control.Monad
import           Control.Monad.ST
import           Data.Array.ST
import           Data.Array.Unboxed

-- VARS
myData :: UArray Int Int
myData = listArray (0,10) [3,7,4,8,5,6,1,0,9,2]

dataToSort :: UArray Int Int
dataToSort = listToUArray [3,7,4,8,5,6,1,0,9,2]

-- FUNC
listToSTUArray :: [Int] -> ST s (STUArray s Int Int)
listToSTUArray vals = do -- runSTUArray $ do --(to avoid creating another function)
  let end = length vals -1
  myArray <- newArray (0, end) 0
  forM_ [0 .. end] $ \i -> do
    let val = vals !! i
    writeArray myArray i val
  return myArray

listToUArray :: [Int] -> UArray Int Int
listToUArray vals = runSTUArray $ listToSTUArray vals

bubbleSort :: UArray Int Int -> UArray Int Int
bubbleSort myArray = runSTUArray $ do
  stArray <- thaw myArray
  let end = (snd . bounds) myArray
  forM_ [1 .. end] $ \i -> do
    forM_ [0 .. end-1] $ \j -> do
      val <- readArray stArray j
      nextVal <- readArray stArray (j+1)
      let outOfOrder = val > nextVal
      when outOfOrder $ do
        writeArray stArray j nextVal
        writeArray stArray (j+1) val
  return stArray

main :: IO ()
main = do
  print $ runSTUArray $ listToSTUArray [1,2,3]
  print $ listToUArray [1,2,3]
  print dataToSort
  print $ bubbleSort dataToSort
  print "All Done!"
