-- arith4.hs
module Arith4 where

-- #4
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main = do
  -- These are the same because roundTrip is the identity function
  print (roundTrip' 4 :: Integer)
  print (id 4)


-- #5
roundTripPF :: (Show a, Read a) => a -> a
roundTripPF = read . show


-- #6
roundTrip' :: (Show a, Read b) => a -> b
roundTrip' a = read (show a)
