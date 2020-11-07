{-
Реализуйте функцию addTwoElements, которая бы добавляла два переданных ей значения в голову переданного списка.

GHCi> addTwoElements 2 12 [85,0,6]
[2,12,85,0,6]

-}


module AddTwoElements (addTwoElements) where

addTwoElements :: t -> t -> [t] -> [t]
addTwoElements x y lst = x : y : lst

{-
addTwoElements x y = (x :) . (y :)
-}