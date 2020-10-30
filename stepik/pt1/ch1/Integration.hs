{-
Реализуйте функцию, находящую значение определённого интеграла от заданной функции ff на заданном интервале [a,b][a,b] методом трапеций. (Используйте равномерную сетку; достаточно 1000 элементарных отрезков.)

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b = undefined

GHCi> integration sin pi 0
-2.0

Результат может отличаться от -2.0, но не более чем на 1e-4.
-}

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b = h * (f1 + f2 (f (a+h)) (a+h) (n-1))
 where n = 1000
       h = (b - a)/n
       f1 = (f a + f b)/2
       f2 acc st n | n == 1 = acc
                | otherwise = f2 (acc+ f (st+h)) (st+h) (n-1)