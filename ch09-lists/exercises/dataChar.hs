-- dataChar.hs
module DataChar where

import Data.Char


-- #1
-- isUpper :: Char -> Bool
-- toUpper :: Char -> Char


-- #2
upperOnly :: String -> String
upperOnly s = filter isUpper s


-- #3
capitalize :: String -> String
capitalize []    = []
capitalize (c:s) = toUpper c : s


-- #4
toUpperCase :: String -> String
toUpperCase [] = []
toUpperCase (c:s) = toUpper c : toUpperCase s


-- #5
upperFirst :: String -> Char
upperFirst []    = '\0'
upperFirst (c:_) = toUpper c


-- #6
-- Need to handle empty strings in both cases
upperFirst' :: String -> Char
upperFirst' s = toUpper . (\x -> if x == [] then '\0' else head x) $  s

upperFirst'' :: String -> Char
upperFirst'' = toUpper . (\x -> if x == [] then '\0' else head x)
