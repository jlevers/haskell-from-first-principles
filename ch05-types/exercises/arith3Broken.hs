-- arith3Broken.hs
module Arith3Broken where

main :: IO ()
-- originally: Main = do
main = do
  -- originally: print 1 + 2
  print (1 + 2)
  -- originally: putStrLn 10
  -- could also be putStrLn "10"
  print 10
  -- originally: print (negate -1)
  print (negate (-1))
  print ((+) 0 blah)
  where blah = negate 1
