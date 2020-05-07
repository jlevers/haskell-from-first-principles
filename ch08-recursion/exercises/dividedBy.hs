-- dividedBy.hs
module DividedBy where

type Numerator = Integer
type Denominator = Integer

data DividedResult =
    Result Integer
  | DividedByZero
  deriving Show


dividedBy :: Numerator -> Denominator -> DividedResult
dividedBy num denom = go num denom 0 (if sameSign num denom then (+) else (-))
  where
    go n d count op
     | d == 0        = DividedByZero
     | abs n < abs d = Result count
     | otherwise     = go (absSubKeepSign n d) d (op count 1) op


sameSign :: Integer -> Integer -> Bool
sameSign x y = x < 0 && y < 0 || x > 0 && y > 0


absSubKeepSign :: Numerator -> Denominator -> Numerator
absSubKeepSign num denom
    | num < 0   = (negate subtracted)
    | otherwise = subtracted
  where subtracted = abs num - abs denom
