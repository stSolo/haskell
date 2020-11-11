{-
Реализуйте функцию sumOdd, которая суммирует элементы списка целых чисел, имеющие нечетные значения:

GHCi> sumOdd [2,5,30,37]
42
-}

sumOdd :: [Integer] -> Integer
sumOdd = foldr (\x s -> if x `mod` 2 /=0 then x + s else s) 0
{-
sumOdd = foldr f 0 
       where f x s | x `mod` 2 /= 0 = x + s
                   | otherwise = s
-}