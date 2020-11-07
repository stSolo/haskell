{-
Составьте список сумм соответствующих элементов трех заданных списков. Длина результирующего списка должна быть равна длине самого длинного из заданных списков, при этом «закончившиеся» списки не должны давать вклада в суммы.

GHCi> sum3 [1,2,3] [4,5] [6]
[11,7,3]
-}

module Sum3 where

sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 x [] [] = x
sum3 [] y [] = y
sum3 [] [] z = z
sum3 (x:xs) (y:ys) [] = (x + y) : sum3 xs ys []
sum3 (x:xs) [] (z:zs) = (x + z) : sum3 xs [] zs
sum3 [] (y:ys) (z:zs) = (y + z) : sum3 [] ys zs
sum3 (x:xs) (y:ys) (z:zs) = (x + y + z) : sum3 xs ys zs


{-
sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 xs ys zs = xs `sum2` ys `sum2` zs
  where
    sum2 [] bs = bs
    sum2 as [] = as
    sum2 (a : as) (b : bs) = (a + b) : sum2 as bs

-}
