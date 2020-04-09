-- applyYourself.hs
module ApplyYourself where

-- #1
(++) :: [a] -> [a] -> [a]
myConcat x = x ++ " yo"
-- The inferred type signature of (++) will change to String -> String -> String, because it was partially applied to a String, and it cannot concatenate that String with anything other than another String.


-- #2
(*) :: Num a => a -> a -> a
myMult x = (x / 3) * 5
-- The inferred type signature of (*) will change to Fractional a => a-> a -> a, because it was partially applied to a value with an instance of Fractional (x / 3).


-- #3
take :: Int -> [a] -> [a]
myTake x = take x "hey you"
-- The inferred type signature of take will change to Int -> String -> String, since a String was passed for the [a] parameter.


-- #4
(>) :: Ord a => a -> a -> Bool
myCom x = x > (length [1..10])
-- The inferred type signature of (>) will change to Int -> Int -> Bool, because (length [1..10]) returns an Int (in this case, 10).


-- #5
(<) :: Ord a => a -> a -> Bool
myAlph x = x < 'z'
-- The inferred type signature of (<) will change to Char -> Char -> Bool, because it was passed an argument of type Char for the type parameter a.
