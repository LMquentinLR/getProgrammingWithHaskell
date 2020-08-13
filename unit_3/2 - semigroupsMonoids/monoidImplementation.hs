class Monoid a where
  mempty :: a
  mappend :: a -> a -> a
  mconcat :: [a] -> a 
  -- mconcat = foldr mappend mempty

-- -- -- -- --
type Events = [String]
type Probs = [Double]

data PTable = PTable Events Probs
instance Show PTable where
  show (PTable events probs) = Prelude.mconcat pairs
    where pairs = zipWith showPair events probs
instance Semigroup PTable where
  (<>) ptable1 (PTable [] []) = ptable1 -- special case of empty PTable
  (<>) (PTable [] []) ptable2 = ptable2
  (<>) (PTable e1 p1) (PTable e2 p2) = createPTable newEvents newProbs
    where newEvents = combineEvents e1 e2
          newProbs = combineProbs p1 p2
instance Prelude.Monoid PTable where
  mempty = PTable [] []
  mappend = (<>)

createPTable :: Events -> Probs -> PTable
createPTable events probs = PTable events normalizedProbs
  where totalProbs = sum probs
        normalizedProbs = map (\x -> x/totalProbs) probs

showPair :: String -> Double -> String
showPair event prob = Prelude.mconcat [event, "|", show prob, "\n"] 

cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2
  where nToAdd = length l2 -- you need to repeat each element in the first list once for each element in the second
        repeatedL1 = map (take nToAdd . repeat) l1 -- Maps l1 and makes nToAdd copies of the element
        newL1 = Prelude.mconcat repeatedL1 -- The preceding line leaves you with a lists of lists, and you need to join them
        cycledL2 = cycle l2 -- By cycling the second list, you can use zipWith to combine these two lists

combineEvents :: Events -> Events -> Events
combineEvents e1 e2 = cartCombine combiner e1 e2
  where combiner = (\x y ->  Prelude.mconcat [x,"-",y]) -- when combining events, you hyphenate the event names
  
combineProbs :: Probs -> Probs -> Probs
combineProbs p1 p2 = cartCombine (*) p1 p2 -- to combine probabilities, you multiply them

--
odds = createPTable ["heads","tails"] [0.5,0.5]
coin :: PTable
coin = createPTable ["heads","tails"] [0.5,0.5]
spinner :: PTable
spinner = createPTable ["Red", "Blue", "Green"] [0.1, 0.2, 0.7]

main = do
  print(zipWith (+) [1,2,3] [4,5,6])
  print(odds)
  print(coin <> spinner)
  print(Prelude.mconcat [coin, coin, coin])