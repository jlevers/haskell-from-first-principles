-- db.hs
module DB where

import Data.Time


data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123)),
    DbNumber 9001,
    DbString "Hello, world!",
    DbDate (UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123)),
    DbNumber 1
  ]


-- #1
dateFilter :: DatabaseItem -> [UTCTime] -> [UTCTime]
dateFilter (DbDate u) us = [u] ++ us
dateFilter _ us          = us

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate [] = []
filterDbDate ds = foldr dateFilter [] ds

-- better version from dwayne/haskell-programming:
-- filterDbDate db = [u | DbDate u <- db]


-- #2
numFilter :: DatabaseItem -> [Integer] -> [Integer]
numFilter (DbNumber i) is = [i] ++ is
numFilter _            is = is

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber [] = []
filterDbNumber ds = foldr numFilter [] ds

-- better version inspired by dwayne/haskell-programming:
-- filterDbNumber db = [n | DbNumber n <- db]


-- #3
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate


-- #4
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber


-- #5
avgDb :: [DatabaseItem] -> Double
avgDb ds = (fromIntegral $ sumDb ds) / (fromIntegral . length $ filterDbNumber ds)

-- Forgot to account for dividing by zero. Better solution:
avgDb db = if tot == 0 then 0 else (fromIntegral tot) / (fromIntegral numNums)
  where tot = sumDb db
        numNums = length . filterDbNumber $ db
