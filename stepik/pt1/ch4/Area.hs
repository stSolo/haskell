{-
Определим тип фигур Shape:

data Shape = Circle Double | Rectangle Double Double
У него два конструктора: Circle r — окружность радиуса r, и Rectangle a b — прямоугольник с размерами сторон a и b. Реализуйте функцию area, возвращающую площадь фигуры. Константа pi уже определена в стандартной библиотеке.
-}


data Shape = Circle Double | Rectangle Double Double deriving Show

area :: Shape -> Double
area (Circle r)= pi * r^2
area (Rectangle a b) = a * b