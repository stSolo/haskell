{-
Реализованные ранее returnLog и bindLog позволяют объявить тип Log представителем класса Monad:

instance Monad Log where
    return = returnLog
    (>>=) = bindLog
Используя return и >>=, определите функцию execLoggersList

execLoggersList :: a -> [a -> Log a] -> Log a
которая принимает некоторый элемент, список функций с логированием и возвращает результат последовательного применения всех функций в списке к переданному элементу вместе со списком сообщений, которые возвращались данными функциями:

GHCi> execLoggersList 3 [add1Log, mult2Log, \x -> Log ["multiplied by 100"] (x * 100)]
Log ["added one","multiplied by 2","multiplied by 100"] 800
-}


data Log a = Log [String] a
  deriving Show

instance Monad Log where
    return = returnLog
    (>>=) = bindLog


returnLog :: a -> Log a
returnLog x = Log [] x


bindLog :: Log a -> (a -> Log b) -> Log b
bindLog (Log x z) f = Log (x ++ str2) x2
 where Log str2 x2 = f z

execLoggersList :: a -> [a -> Log a] -> Log a
execLoggersList n [] = return n
execLoggersList n (f : fs) = f n >>= flip execLoggersList fs


-- foldl ()>>=) . return