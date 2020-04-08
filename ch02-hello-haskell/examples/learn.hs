-- learn.hs

module Learn where

x = 10 * 5 + y

myResult = x * 5

y = 10


-- Code that is part of an expression should be indented under the beginning of that expression.
-- Grouped parts of an expression should be indented to the same level.
-- let
--   x = 3
--   y = 4

-- or

-- let x = 3
--     y = 4

-- not

-- let x = 3
--  y = 4

-- or

-- let
--  x = 3
--   y = 4


-- Multipart expressions:

-- foo x =
--   let y = x * 2
--       z = x ^ 2
--   in 2 * y * z
