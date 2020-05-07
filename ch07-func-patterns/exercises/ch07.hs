-- ch07.hs
module Ch07 where

-- #1
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

-- a)
tensDigit' :: Integral a => a -> a
tensDigit' x = snd . (`divMod` 10) $ fst . (`divMod` 10) $ x

-- b) Yes

-- c)
hunsD :: Integral a => a -> a
hunsD x = d
  where xLast = x `div` 100
        d     = xLast `mod` 10

nsDigit :: Integral a => a -> a -> a -> a
nsDigit digit base n = d
  where nLast = n `div` digit
        d     = nLast `mod` base


-- Returns the digit in the `digit`s place of `n`, given n is a base `base` number system
-- e.g., getting the number in the 100s place in the base 10 number 123 would be:
-- nsDigit 100 10 123
nsDigit' :: Integral a => a -> a -> a -> a
nsDigit' digit base n =
  snd . (`divMod` 10) . comp $ n
  where logDigit = round $ logBase (fromIntegral base) (fromIntegral digit)
        comp = foldr (.) id $ replicate logDigit $ fst . (`divMod` 10)


-- #2
foldBoolCase :: a -> a -> Bool -> a
foldBoolCase x y b =
  case b of
    True  -> y
    False -> x

foldBoolGuard :: a -> a -> Bool -> a
foldBoolGuard x y b
  | b         = y
  | otherwise = x



-- #3
g :: (a -> b) -> (a, c) -> (b, c)
g aToB (a, c) = (aToB a, c)


-- #4: see ./arith4.hs
