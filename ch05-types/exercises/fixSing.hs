-- fixSing.hs
module FixSing where

-- originally: fstString :: [Char] ++ [Char]
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

-- originally: sndString :: [Char] -> Char
sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

-- originally:
-- sing = if (x > y) then fstString x or sndString y
-- where x = "Singin"
--       x = "Somewhere"
sing = if (x < y) then fstString x else sndString y
  where x = "Singin"
        y = "Somewhere"
