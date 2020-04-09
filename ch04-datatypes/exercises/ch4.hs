-- ch4.hs
module Ch4 where

-- #8
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x


-- #9
myAbs :: Integer -> Integer
myAbs x = if x < 0 then (-1) * x else x


-- #10
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))


-- Correcting Syntax

-- #1
x = (+)

f2 :: [a] -> Int
f2 xs = x w 1
       where w = length xs


-- #2
ident :: a -> a
ident x = x


-- #3
f3 :: (a, b) -> a
f3 (x, y) = x
