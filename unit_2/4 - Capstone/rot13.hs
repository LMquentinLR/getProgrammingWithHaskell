data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded, Eq)
data ThreeLetterAlphabet = Alpha | Beta | Kappa deriving (Show, Enum, Bounded)


message :: [FourLetterAlphabet]
message = [L1,L3,L4,L1,L1,L2]


threeLetterMsg :: [ThreeLetterAlphabet]
threeLetterMsg = [Alpha, Alpha, Beta, Alpha, Kappa]


largestCharNumber :: Int
largestCharNumber = fromEnum (maxBound :: Char)  


largest4lNumber :: Int
largest4lNumber = fromEnum (maxBound :: FourLetterAlphabet)


largest3lNumber :: Int
largest3lNumber = fromEnum (maxBound :: ThreeLetterAlphabet)


rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize c = toEnum rotation
  where halfAlphabet = alphabetSize `div` 2 -- finds the middle value of the alphabet
        offset = fromEnum c + halfAlphabet -- uses the middle to find the offset of your character
        rotation = offset `mod` alphabetSize -- uses modulo arithmetic to make sure you're un the bounds of your Enum


rotChar :: Char -> Char
rotChar charToEncrypt = rotN sizeOfAlphabet charToEncrypt
  where sizeOfAlphabet = 1 + largestCharNumber

  
fourLetterEncoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterEncoder vals = map rot4l vals
  where alphaSize = 1 + largest4lNumber
        rot4l = rotN alphaSize


threeLetterEncoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterEncoder vals = map rot3l vals
  where alphaSize = 1 + largest3lNumber
        rot3l = rotN alphaSize


rotNDecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNDecoder n c = toEnum rotation
  where halfN = n `div` 2
        offset = if even n
                 then fromEnum c + halfN
                 else 1 + fromEnum c + halfN
        rotation = offset `mod` n


threeLetterDecoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterDecoder vals = map rot3ldecoder vals
  where alphaSize = 1 + largest3lNumber
        rot3ldecoder = rotNDecoder alphaSize

  
alphabetEncoder :: [Char] -> [Char]
alphabetEncoder vals = map rotChar vals


alphabetDecoder :: [Char] -> [Char]
alphabetDecoder vals = map rotCharDecoder vals
  where alphaSize = 1 + largestCharNumber
        rotCharDecoder = rotNDecoder alphaSize
        
        
main = do
  print(rotN 4 L1)
  print(rotN 4 L2)
  print(rotN 4 L3)
  print(rotN 4 L4)
  print(rotN 2 True)
  print(rotN 2 False)
  print(rotChar 'q')
  --
  print(map (rotN 4) message)
  print(fourLetterEncoder message)
  print((map (rotN 4) message)==(fourLetterEncoder message))
  --
  print(fourLetterEncoder message)
  print(fourLetterEncoder (fourLetterEncoder message))
  print(threeLetterMsg)
  print(threeLetterEncoder threeLetterMsg)
  print(threeLetterEncoder $ threeLetterEncoder threeLetterMsg) -- doesn't work for odd numbers
  --
  print(threeLetterMsg)
  print(threeLetterEncoder threeLetterMsg)
  print( threeLetterDecoder $ threeLetterEncoder threeLetterMsg)
  --
  print(alphabetEncoder "Jean-Paule Sartre likes Simone De Beauvoir")
  print(alphabetDecoder $ alphabetEncoder "Jean-Paule Sartre likes Simone De Beauvoir")
  
  