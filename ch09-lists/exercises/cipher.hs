-- cipher.hs
module Cipher where

import Data.Char


-- Caesar shift a string
caesar :: Int -> String -> String
caesar _ ""  = ""
caesar shift str = map (alphaShiftChar shift) str


-- Decipher a string that has been encoded wtih the given Caesar shift
unCaesar :: Int -> String -> String
unCaesar shift = caesar (-1 * shift)


alphaShiftChar :: Int -> Char -> Char
alphaShiftChar shift c = chr $ idx + bound
  where
    bound = lowerBound c
    idx   = ((ord c) - bound + shift) `mod` 26


lowerBound :: Char -> Int
lowerBound c =
  if isUpper c
  then upperMin
  else lowerMin
  where upperMin = ord 'A'
        lowerMin = ord 'a'
