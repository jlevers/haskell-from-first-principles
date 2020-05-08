-- rewriting.hs
module Rewriting where


-- #1
myOr :: [Bool] -> Bool
myOr = foldr (\a b ->
                if a == True
                then True
                else b)
       False

myOr' :: [Bool] -> Bool
myOr' = foldr (||) False



-- #2
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\a b ->
                   if f a
                   then True
                   else b)
          False

myAny' :: (a -> Bool) -> [a] -> Bool
myAny' f = foldr ((||) . f) False



-- #3
myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr (\a b -> a == x) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = any (==x)


-- #4
myReverse :: [a] -> [a]
myReverse = foldl (\a b -> b:a) []

myReverse' :: [a] -> [a]
myReverse' = foldl (flip (:)) []


-- #5
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\a b -> f a : b) []

myMap' :: (a -> b) -> [a] -> [b]
myMap' f = foldr ((:) . f) []


-- #6
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\a b ->
                      if f a
                      then a:b
                      else b)
             []



-- #7
squish :: [[a]] -> [a]
squish = foldr (++) []


-- #8
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []


-- #9
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id


-- #10
myMaximumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMaximumBy f xs = foldr (\a b ->
                            if f a b == GT
                            then a else b)
                   (last xs) xs


-- #11
myMinimumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMinimumBy f xs = foldr (\a b ->
                           if f a b == LT
                           then a else b)
                   (last xs) xs


myOrderingBy :: (a -> a -> Ordering)
             -> Ordering
             -> [a]
             -> a
myOrderingBy f ord xs = foldr (\a b ->
                                 if f a b == ord
                                 then a else b)
                        (last xs) xs

myMaxBy f xs = myOrderingBy f GT xs
myMinBy f xs = myOrderingBy f LT xs
