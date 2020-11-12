{-
Реализуйте функцию meanList, которая находит среднее значение элементов списка, используя однократный вызов функции свертки.

GHCi> meanList [1,2,3,4]
2.5
Постобработка считается допустимой, то есть предполагаемая реализация функции meanList имеет вид

meanList = someFun . foldr someFoldingFun someIni
-}

meanList :: [Double] -> Double
meanList = let mean (x,y) = x / y
           in mean . foldr (\x (s,l) -> (x+s, l+1)) (0,0)


--meanList = (uncurry (/)) . (foldr (\x (s, cnt) -> (s + x, cnt + 1)) (0, 0))