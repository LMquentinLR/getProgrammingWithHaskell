{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString as B
import qualified Data.Text as T 
import qualified Data.Text.IO as TIO 
import qualified Data.Text.Encoding as E 
import Data.Maybe

------------ TYPES

type Author = T.Text
type Title = T.Text
type Html = T.Text

data Book = Book { author :: Author
                 , title :: Title } deriving Show

------------ VALUES

book1 :: Book
book1 = Book { title = "Skyward"
             , author = "Sanderson, Brandon" }

book2 :: Book
book2 = Book { title = "Cat's Cradle"
             , author = "Vonnegut, Kurt" }

book3 :: Book
book3 = Book { title = "The Black Company"
             , author = "Cook, Glen" }

myBooks :: [Book]
myBooks = [book1, book2, book3]

------------ FUNCTIONS

bookToHtml :: Book -> Html
bookToHtml book = mconcat [ "<p>\n"
                          , titleInTags
                          , authorInTags
                          , "</p>\n"]
  where titleInTags = mconcat ["<strong>", (title book), "</strong>\n"]
        authorInTags = mconcat ["<em>", (author book), "</em>\n"]

booksToHtml :: [Book] -> Html
booksToHtml books = mconcat [ "<html>\n"
                            , "<head><title>books</title>"
                            , "<meta charset='utf-8'/>"
                            , "</head>\n"
                            , "<body>\n"
                            , booksHtml
                            , "\n</body>\n"
                            , "</html>" ]
  where booksHtml = (mconcat . (map bookToHtml)) books

------------ MAIN

main :: IO ()
main = do
  TIO.writeFile "books.html" (booksToHtml myBooks)
  putStrLn "All Done!"
  