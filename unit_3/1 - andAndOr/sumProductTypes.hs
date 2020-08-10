-- Product Types
--data AuthorName = AuthorName String String 
--data Book = Author String String Int

--data Book2 = Book2 {
--    author :: AuthorName
--  , isbn   :: String
--  , title  :: String
--  , year   :: Int
--  , price  :: Double }

--data AuthorName2 = AuthorName2 {
--    firstName :: String
--  , lastName  :: String }

-- Sum Types
type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
   | NameWithMiddle FirstName MiddleName LastName
   | TwoInitialsWithLast Char Char LastName
   | FirstNameWithTwoInits FirstName Char Char

--
data Author = Author Name
data Artist = Person Name | Band String
data Creator = AuthorCreator Author | ArtistCreator Artist

hpLovecraft :: Creator
hpLovecraft = AuthorCreator 
                (Author
                  (TwoInitialsWithLast 'H' 'P' "Lovecraft"))

--
data Book3 = Book3 {
    bookAuthor :: Creator
  , bookIsbn   :: String
  , bookTitle  :: String
  , bookYear   :: Int
  , bookPrice  :: Double }

data VinylRecord = VinylRecord {
    artist      :: Creator
  , recordTitle :: String
  , recordYear  :: Int
  , recordPrice :: Double }
  
data CollectibleToy = CollectibleToy {
    name        :: String
  , description :: String
  , toyPrice    :: Double }
  
data StoreItem = BookItem Book3
   | RecordItem VinylRecord
   | ToyItem CollectibleToy
   
price :: StoreItem -> Double
price (BookItem book) = bookPrice book
price (RecordItem record) = recordPrice record
price (ToyItem toy) = toyPrice toy