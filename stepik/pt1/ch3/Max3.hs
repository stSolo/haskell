{-
Напишите функцию max3, которой передаются три списка одинаковой длины и которая возвращает список той же длины, содержащий на k-ой позиции наибольшее значение из величин на этой позиции в списках-аргументах.

GHCi> max3 [7,2,9] [3,6,8] [1,8,10]
[7,8,10]
GHCi> max3 "AXZ" "YDW" "MLK"
"YXZ"
-}

max3 :: Ord a => [a] -> [a] -> [a] -> [a]
max3 xs ys zs = zipWith3 max3' xs ys zs 
 where max3' x y z = x `max` y `max` z


--without dots-style
--max3 = zipWith3 ((max .) . max)