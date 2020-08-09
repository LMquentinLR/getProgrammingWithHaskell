-- XOR is symmetric
type Bits = [Bool]


xorBool :: Bool -> Bool -> Bool
xorBool value1 value2 = (value1 || value2) && (not (value1 && value2))


xorPair :: (Bool, Bool) -> Bool
xorPair (v1, v2) = xorBool v1 v2


xor :: [Bool] -> [Bool] -> [Bool]
xor list1 list2 = map xorPair (zip list1 list2)


oldIntToBits :: Int -> Bits
oldIntToBits 0 = [False]
oldIntToBits 1 = [True]
oldIntToBits n = if (remainder == 0)
              then False : oldIntToBits nextVal
              else True : oldIntToBits nextVal
  where remainder = n `mod` 2
        nextVal = n `div` 2


maxBits :: Int
maxBits = length (oldIntToBits maxBound)


intToBits :: Int -> Bits
intToBits n = leadingFalses ++ reversedBits
  where reversedBits = reverse (oldIntToBits n)
        missingBits = maxBits - (length reversedBits)
        leadingFalses = take missingBits (cycle [False])


charToBits :: Char -> Bits
charToBits char = intToBits (fromEnum char)


bitsToInt :: Bits -> Int
bitsToInt bits = sum (map (\x -> 2^(snd x)) trueLocations)
  where size = length bits 
        indices = [size-1, size-2 .. 0]
        trueLocations = filter (\x -> fst x == True) (zip bits indices)


bitsToChar :: Bits -> Char
bitsToChar bits = toEnum (bitsToInt bits)

------

myPad :: String
myPad = "Shhhhhh"

myPlainTest :: String
myPlainTest = "Haskell"

applyOTP' :: String -> String -> [Bits]
applyOTP' pad plaintext = map (\pair -> (fst pair) `xor` (snd pair))
                              (zip padBits plaintextBits)
  where padBits = map charToBits pad
        plaintextBits = map charToBits plaintext


applyOTP :: String -> String -> String
applyOTP pad plaintext = map bitsToChar bitList
  where bitList = applyOTP' pad plaintext
        
 
encoderDecoder :: String -> String
encoderDecoder = applyOTP myPad

------

class Cipher a where
  encode :: a -> String -> String
  decode :: a -> String -> String
   
data OneTimePad = OTP String
instance Cipher OneTimePad where
  encode (OTP pad) text = applyOTP pad text
  decode (OTP pad) text = applyOTP pad text

myOTP :: OneTimePad
myOTP = OTP (cycle [minBound .. maxBound])
  
main = do
  print(applyOTP myPad myPlainTest)
  print(encoderDecoder "book")
  print(encoderDecoder "1\a\a\ETX")
  ---
  print(encode myOTP "Learn Haskell")
  print(decode myOTP "ldcqj%Nf{bog`")
  print(encode myOTP "This is a longer sentence, I hope it encodes")
  print(decode myOTP "Tikp$lu'i)fdbjk}0bw}`pxt}5:R<uqoE\SOHKW\EOT@HDGMOX")