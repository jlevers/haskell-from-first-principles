-- zipping.hs
module Zipping where


-- #1
myZip :: [a] -> [b] -> [(a, b)]
myZip xs ys = go xs ys []
  where
    go [] _ tups = tups
    go _ [] tups = tups
    go (x:xs) (y:ys) tups = go xs ys $ tups ++ [(x, y)]


-- #2
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f xs ys = go f xs ys []
  where
    go _ [] _ lst = lst
    go _ _ [] lst = lst
    go f (x:xs) (y:ys) lst = go f xs ys $ lst ++ [f x y]


-- #3
myZip' :: [a] -> [b] -> [(a, b)]
myZip' xs ys = myZipWith (\x -> \y -> (x, y)) xs ys
