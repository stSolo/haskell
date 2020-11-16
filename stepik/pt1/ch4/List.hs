{-
Тип List, определенный ниже, эквивалентен определению списков из стандартной библиотеки в том смысле, что существуют взаимно обратные функции, преобразующие List a в [a] и обратно. Реализуйте эти функции.
-}

data List a = Nil | Cons a (List a) deriving Show


fromList :: List a -> [a]
fromList Nil = []
fromList (Cons x ys) = x : fromList ys


toList :: [a] -> List a
toList [] = Nil
toList (x:xs) = Cons x (toList xs)