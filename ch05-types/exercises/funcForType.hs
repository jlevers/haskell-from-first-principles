-- funcForType.hs
module FuncForType where

-- #1
i :: a -> a
i x = x


-- #2
c :: a -> b -> a
c x y = x


-- #3
-- Yes, #2 and #3 are the same thing given alpha equivalence.
c'' :: b -> a -> b
c'' b a = b


-- #4
c' :: a -> b -> b
c' x y = y


-- #5
r :: [a] -> [a]
r x = drop 0 x


-- #6
co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)


-- #7
a :: (a -> c) -> a -> a
a aToC a = a


-- #8
a' :: (a -> b) -> a -> b
a' aToB a = aToB a
