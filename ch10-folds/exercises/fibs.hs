-- fibs.hs
module Fibs where


fibs = 0 : scanl (+) 1 fibs
fibsN x = fibs !! x


-- #1
fibs' = take 20 $ fibs


-- #2
fibs'' = takeWhile (<100) fibs


-- #3
factorial = scanl (\x y -> (fst y + 1, (fst y + 1) * snd x)) (1, 1) factorial
factX x = map snd $ take x factorial

-- Way, way better implementation from dwayne/haskell-programming:
factorial' = scanl (*) 1 [2..]
-- I was stuck on the idea of making the list recursive by defining the list
-- in terms of itself, rather than in terms of some infinite series.
