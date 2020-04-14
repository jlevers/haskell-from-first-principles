-- typeKwonDo2.hs
module TypeKwonDo2 where


-- #1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk aToB a b = aToB a == b


-- #2
arith :: Num b => (a -> b) -> Integer -> a -> b
arith aToB num a = fromInteger num + (aToB a)
