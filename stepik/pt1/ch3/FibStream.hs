{-
Реализуйте c использованием функции zipWith функцию fibStream, возвращающую бесконечный список чисел Фибоначчи.

GHCi> take 10 $ fibStream
[0,1,1,2,3,5,8,13,21,34]

-}

{-
fibStream :: [Integer]
fibStream = 0:1: zipWith(+) fibStream (tail fibStream)
-}


fibStream :: [Integer]
fibStream = zipWith (-) (tail $ tail $ fib 0 1) (tail $ fib 0 1)
 where fib x y = x : fib y (x+y)
