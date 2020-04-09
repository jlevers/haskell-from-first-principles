{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

-- #1
-----

-- a)
ex1a = (* 9) 6
-- Evaluates to 54, of type Num a => a.

-- b)
ex1b = head [(0, "doge"), (1, "kitteh")]
-- Evaluates to (0, "doge"), of type Num a => (a, String).

-- c)
ex1c = head [(0 :: Integer, "doge"), (1, "kitteh")]
-- Evaluates to (0, "doge"), of type (Integer, String).

-- d)
ex1d = if False then True else False
-- Evaluates to True, of type Bool.

-- e)
ex1e = length [1, 2, 3, 4, 5]
-- Evaluates to 5, of type Int.

--f)
ex1f = (length [1, 2, 3, 4]) > (length "TACOCAT")
-- Evaluates to False, of type Bool.


-- #2
x1 = 5
y1 = x1 + 5
w = y1 * 10
-- w is of type Num a => a.


-- #3
x2 = 5
y2 = x2 + 5
z y = y * 10
-- z is of type Num a => a -> a.


-- #4
x3 = 5
y3 = x3 + 5
f1 = 4 / y3
-- f is of type Fractional a => a.


-- #5
x4 = "Julie"
y4 = " <3 "
z2 = "Haskell"
f2 = x4 ++ y4 ++ z2
-- f is of type String (or [Char]).
