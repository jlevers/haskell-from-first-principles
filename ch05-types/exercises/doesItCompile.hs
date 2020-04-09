-- doesItCompile.hs
module DoesItCompile where

-- #1
bigNum = (^) 5 $ 10
wahoo = bigNum $ 10
-- This causes issues because in wahoo, we're attemping to apply 10, of type Num a => a, to bigNum, which is also of type Num a => a.


-- #2
x = print
y = print "woohoo!"
z = x "hello world"
-- This works fine.


-- #3
a = (+)
b = 5
c = b 10
d = c 200
-- This errors because in c, we're trying to apply b (of type Num a => a) to 10 (of type Num a => a), which doesn't make sense. The same issue would be true at d if the compiler ever got there. To fix it:
b = a 5
c = a (b 10)
d = c 200


-- #4
a = 12 + b
b = 10000 * c
-- b is defined in terms of c, which is not in scope, so neither b nor a can be computed.
