-- filtering.hs
module Filtering where

-- #1
multsOfThree :: Integral a => [a] -> [a]
multsOfThree xs = [x | x <- xs, x `rem` 3 == 0]


-- #2
numMultsOfThree :: Integral a => [a] -> Int
numMultsOfThree xs = length . multsOfThree $ xs


-- #3
nonArticleWords :: String -> [String]
nonArticleWords s = filter (\x -> not $ elem x ["the", "a", "an"]) $ words s
