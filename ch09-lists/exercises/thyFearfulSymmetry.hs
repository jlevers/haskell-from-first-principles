-- thyFearfulSymmetry.hs
module ThyFearfulSymmetry where

-- #1
myWords :: String -> [String]
myWords s = go s []
  where pred = (/=' ')
        go s acc
          | length s > 0 = go (drop 1 (dropWhile pred s)) (acc ++ [takeWhile pred s])
          | otherwise    = acc


-- #2
myLines :: String -> [String]
myLines s = go s []
  where pred = (/='\n')
        go s acc
          | length s > 0 = go (drop 1 (dropWhile pred s)) (acc ++ [takeWhile pred s])
          | otherwise    = acc



firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
            \ symmetry?"
sentences = firstSen ++ secondSen
         ++ thirdSen ++ fourthSen

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]


main :: IO ()
main =
  print $
  "Are they equal? "
  ++ show (myLines sentences == shouldEqual)



-- #3
splitOnChar :: String -> Char -> [String]
splitOnChar s c = go s []
  where pred = (/= c)
        go s acc
            | length s > 0 = go (drop 1 (dropWhile pred s)) (acc ++ [chunk])
            | otherwise    = acc
          where chunk = takeWhile pred s
