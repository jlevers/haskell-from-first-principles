-- doesItTypecheck.hs
module DoesItTypecheck where


-- #1
-- Original:
-- data Person = Person Bool
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
-- This will not typecheck with the original data definition, because Person is not an instance of Show.


-- #2
data Mood = Blah
          | Woot deriving Show

-- Original:
settleDown x = if x == Woot
               then Blah
               else x
-- This originally fails because x is not guaranteed to have an instance of Eq, so it can't be compared with a Mood. Also, Mood has no instance of Eq either, so it also can't be compared. Finally, it returns a Mood in one case and an unknown type x in the other case, which is illegal.

instance Eq Mood where
  (==) Woot Woot = True
  (==) Blah Blah = True
  (==) _ _       = False


-- #3a) Only Moods are valid inputs
-- #3b) Running settleDown 9 will result in a runtime error, because 9 and Woot can't be compared.
-- #3c) Blah > Woot will fail because Ord is a subclass of Eq, and I only defined Eq on Mood.


-- #4
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
-- I think it will typecheck, because s1 appears to be effectively a partially applied type, but Eq and Show methods will not work on it.
