-- buildingfns.hs
module BuildingFns where

-- #2
-- (a)
ex2a :: String -> String
ex2a s = s ++ "!"

-- (b)
ex2b :: String -> String
ex2b s = drop 4 (take 5 s)

-- (c)
ex3c :: String -> String
ex3c s = drop 9 s


-- #3
thirdLetter :: String -> Char
thirdLetter s = s !! 2


-- #4
letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x


-- #5
rvrs :: String -> String
rvrs s = drop 9 s ++ drop 5 (take 9 s) ++ take 5 s


-- #6
main :: IO ()
main = print $ rvrs "Curry is awesome"
