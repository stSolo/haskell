{-
Сформируйте список целых чисел, содержащий только те элементы исходного списка, значение которых нечетно.

GHCi> oddsOnly [2,5,7,10,11,12]
[5,7,11]
-}


module OddsOnly where

oddsOnly :: Integral a => [a] -> [a]
oddsOnly [] = []
oddsOnly (x : xs) | odd x = x : oddsOnly xs
                 | otherwise = oddsOnly xs 