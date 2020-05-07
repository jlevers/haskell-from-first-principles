-- enumFromTo.hs
module EnumFromTo where

eftBool :: Bool -> Bool -> [Bool]
eftBool min max = go min max []
  where go mn mx acc
         | mx > mn   = go mn (pred mx) (mx:acc)
         | mn == mx  = mx:acc
         | otherwise = []


eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd min max = go min max []
  where go mn mx acc
         | mn < mx   = go mn (pred mx) (mx:acc)
         | mn == mx  = mx:acc
         | otherwise = []


eftChar :: Char -> Char -> [Char]
eftChar min max = go min max []
  where go mn mx acc
         | mn < mx   = go mn (pred mx) (mx:acc)
         | mn == mx  = mx:acc
         | otherwise = []


eft :: (Enum a, Ord a) => a -> a -> [a]
eft min max = go min max []
  where go mn mx acc
         | mn < mx   = go mn (pred mx) (mx:acc)
         | mn == mx  = mx:acc
         | otherwise = []  -- If max < min, return empty list
