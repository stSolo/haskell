{-
Реализуйте функцию nTimes, которая возвращает список, состоящий из повторяющихся значений ее первого аргумента. Количество повторов определяется значением второго аргумента этой функции.

GHCi> nTimes 42 3
[42,42,42]
GHCi> nTimes 'z' 5
"zzzzz"
-}


module NTimes where

nTimes :: a -> Int -> [a]
nTimes x y | y == 0 = []
           | otherwise = x : nTimes x (y - 1)

{-
helper :: a -> Int -> [a] -> [a]
helper x y z | y == 0 = z
             | otherwise =  helper x (y-1) (x : z)
-}