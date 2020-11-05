{-
Напишите функцию с сигнатурой:

avg :: Int -> Int -> Int -> Double
вычисляющую среднее значение переданных в нее аргументов:

GHCi> avg 3 4 8
5.0
-}

avg :: Int -> Int -> Int -> Double
avg x y z =  ( convert x + convert y + convert z ) / convert 3

convert :: Int -> Double
convert x = fromIntegral x :: Double