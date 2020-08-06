--Prelude> :t (+)
--(+) :: Num a => a -> a -> a
--Prelude> :info Num
--type Num :: * -> Constraint
--class Num a where
--  (+) :: a -> a -> a
--  (-) :: a -> a -> a
--  (*) :: a -> a -> a
--  negate :: a -> a
--  abs :: a -> a
--  signum :: a -> a
--  fromInteger :: Integer -> a
--  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
--        -- Defined in `GHC.Num'
--instance Num Word -- Defined in `GHC.Num'
--instance Num Integer -- Defined in `GHC.Num'
--instance Num Int -- Defined in `GHC.Num'
--instance Num Float -- Defined in `GHC.Float'
--instance Num Double -- Defined in `GHC.Float'

class Describable a where
  describe :: a -> String

class Bounded a where
  minBound :: a
  maxBound :: a
  
class Show a where
  show :: a -> String

data Icecream = Chocolate | Vanilla deriving (Prelude.Show, Eq, Ord)

myAdd :: Num a => a -> a -> a
myAdd x y = x + y

myAdd2 x y = x + y

addThenDouble :: Num a => a -> a -> a
addThenDouble x y = (x + y) * 2

main = do
  let a = 1
  let b = 2
  print(myAdd a b)
  print(myAdd2 a b)
  print(addThenDouble a b)  
  print(Chocolate)
  print(Vanilla)
  print(Chocolate == Chocolate)
  print(Chocolate > Vanilla)
  print(Chocolate /= Vanilla)