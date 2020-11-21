{-
Пусть имеется тип данных, который описывает конфигурацию шахматной доски:

data Board = ...
Кроме того, пусть задана функция
nextPositions :: Board -> [Board]
которая получает на вход некоторую конфигурацию доски и возвращает все возможные конфигурации, которые могут получиться, если какая-либо фигура сделает один ход. Напишите функцию:
nextPositionsN :: Board -> Int -> (Board -> Bool) -> [Board]
которая принимает конфигурацию доски, число ходов n, предикат и возвращает все возможные конфигурации досок, которые могут получиться, если фигуры сделают n ходов и которые удовлетворяют заданному предикату. При n < 0 функция возвращает пустой список.


-}

--Тип Board и функция nextPositions заданы, реализовывать их не нужно




{-
textPrint :: (Ord a, Num a) => a -> IO ()
textPrint n = do
    if n > 1 then do
        print "hi"
    else if n == 0 then do
        print "llo"
    else do
        print "world"
-}

nextPositionsN :: Board -> Int -> (Board -> Bool) -> [Board]
nextPositionsN b n pred | n < 0 = []
                        | n == 0 = filter pred [b]
                        | otherwise = do
                            nextPos <- nextPositions b
                            allPos <- nextPositionsN nextPos (n-1) pred
                            return allPos
]
     