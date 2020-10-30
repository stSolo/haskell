{-
Реализуйте функцию, находящую сумму и количество цифр десятичной записи заданного целого числа.

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = undefined

GHCi> sum'n'count (-39)
(12,2)

-}

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x | x == 0 = (0,1)
 | x > 0 = helper 0 0 x
 | otherwise = helper 0 0 (abs x)
 where 
  helper a b x | x < 10 = (a + x, b+1)
   | otherwise = helper (a + (x `mod` 10)) (b+1) (x `div` 10)