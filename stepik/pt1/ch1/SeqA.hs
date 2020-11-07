module SeqA where

{-
Реализуйте функцию seqA, находящую элементы следующей рекуррентной последовательности

a_0 = 1
a_1 = 2
a_2 = 3
a_(k+3) = a_(k+2)+a_(k+1) - 2*a_k

Попытайтесь найти эффективное решение.

GHCi> seqA 301
1276538859311178639666612897162414

-}

seqA :: Integer -> Integer
seqA n | n == 0 = 1
       | n == 1 = 2
       | n == 2 = 3
       | n > 2 = let helper a b c d | d == 2 = c 
                          | otherwise = helper b c (c + b - (2*a)) (d-1) 
                          in helper 1 2 3 n
       | otherwise = error "error"

