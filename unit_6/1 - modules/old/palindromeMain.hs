module PalindromeMain where

isPalindrome :: String -> Bool
isPalindrome text = text == reverse text

main :: IO()
main = do
  print "Enter a word and I will let you know if it's a palindrome!"
  text <- getLine
  let response = if isPalindrome text
                 then "it is"
                 else "it's not"
  print response
