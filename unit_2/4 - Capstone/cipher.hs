largestCharNumber :: Int
largestCharNumber = fromEnum (maxBound :: Char)  

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize c = toEnum rotation
  where halfAlphabet = alphabetSize `div` 2 -- finds the middle value of the alphabet
        offset = fromEnum c + halfAlphabet -- uses the middle to find the offset of your character
        rotation = offset `mod` alphabetSize -- uses modulo arithmetic to make sure you're un the bounds of your Enum

rotChar :: Char -> Char
rotChar charToEncrypt = rotN sizeOfAlphabet charToEncrypt
  where sizeOfAlphabet = 1 + largestCharNumber

rotNDecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNDecoder n c = toEnum rotation
  where halfN = n `div` 2
        offset = if even n
                 then fromEnum c + halfN
                 else 1 + fromEnum c + halfN
        rotation = offset `mod` n

rotEncoder :: String -> String
rotEncoder text = map rotChar text
  where alphaSize = 1 + largestCharNumber
        rotChar = rotN alphaSize

rotDecoder :: String -> String
rotDecoder text = map rotCharDecoder text
  where alphaSize = 1 + largestCharNumber
        rotCharDecoder = rotNDecoder alphaSize
   
class Cipher a where
  encode :: a -> String -> String
  decode :: a -> String -> String
   
data Rot = Rot
instance Cipher Rot where
  encode Rot text = rotEncoder text
  decode Rot text = rotDecoder text
   
  
main = do
  print(encode Rot "Haskell")
  print(decode Rot "\557128\557153\557171\557163\557157\557164\557164")
  
  