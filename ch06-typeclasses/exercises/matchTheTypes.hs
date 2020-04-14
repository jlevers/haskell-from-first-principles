-- matchTheTypes.hs
module MatchTheTypes where

import Data.List (sort)

-- #1
i :: Num a => a
i = 1

-- i :: a
-- Doesn't compile because `a` is too general, since the original typeclass is Num and 1 defaults to Num a => a, not just a.


-- #2
f :: Float
f = 1.0

-- f :: Num a => a
-- Doesn't compile, because the default type for 1.0 is Fractional a => a, which is lower-level than Num.


-- #3
f' :: Float
f' = 1.0

-- f' :: Fractional a => a
-- Compiles, because Float is a concrete type, and concrete types imply their typeclasses. Float has an instance of Fractional, and so all Floats are Fractional.


-- #4
f'' :: Float
f'' = 1.0

-- f'' :: RealFrac a => a
-- Compiles, because RealFrac is a subclass of Fractional, and f'' is Fractional.


-- #5
freud :: a -> a
freud x = x

-- freud :: Ord a => a -> a
-- Compiles. `x` is a generic variable and no operations are being performed on it, so it can be restricted to any typeclass.


-- #6
freud' :: a -> a
freud' x = x

-- freud' :: Int -> Int
-- Compiles. `x` is a generic variable and no operations are being performed on it, so it can be bound to any concrete type.


-- #7
myX = 1 :: Int
sigmund :: Int -> Int
sigmund x = myX

-- sigmund :: a -> a
-- Does not compile, because you cannot type an Int to a generic type a.


-- #8
myX' = 1 :: Int
sigmund' :: Int -> Int
sigmund' x = myX'

-- sigmund :: Num a => a -> a
-- This won't compile, because since sigmund' returns myX' regardless of input, you can't generalize the type. You might be able to generalize it to Num a => a -> Int, but not to Num a => a -> a, because the return type is unchangeably Int. (Note: looks like I was wrong about the second part of that.)


-- #9
jung :: Ord a => [a] -> a
jung xs = head (sort xs)

-- jung :: [Int] -> Int
-- This wil compile -- Int has an instance of Ord.


-- #10
young :: [Char] -> Char
young xs = head (sort xs)

-- young :: Ord a => [a] -> a
-- This will compile, because Char is a concrete type with an instance of Ord.


-- #11
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)

-- signifier :: Ord a => [a] -> a
-- Won't compile, because signifier uses mySort, which uses concrete types and cannot be generalized.

