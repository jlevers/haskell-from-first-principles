-- std.hs
module Std where


-- #1
myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs


-- #2
myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = myOr (map f xs)


-- #3
myElem :: Eq a => a -> [a] -> Bool
myElem x xs = myAny (==x) xs


-- #4
myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]


-- #5
squish :: [[a]] -> [a]
squish xs = go xs []
  where
    go [] acc       = acc
    go (x':xs') acc = go xs' (acc ++ x')


-- #6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f xs = go f xs []
  where
    go _ [] acc        = acc
    go f' (x':xs') acc = go f' xs' (acc ++ f' x')


-- #7
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id


-- #8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ []     = error "myMaximumBy requires a list with at least one element."
myMaximumBy f (x:xs) = go f xs x
  where
    go _ [] x'         = x'
    go f' (x':xs') m = go f' xs' (if f' x' m == GT then x' else m)


-- #9
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ []    = error "myMinimumBy requires a list with at least one element."
myMinimumBy f (x:xs) = go f xs x
  where
    go _ [] x'        = x'
    go f' (x':xs') m  = go f' xs' (if f x' m == LT then x' else m)


-- #10
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
