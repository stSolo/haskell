{-
Напишите функцию groupElems которая группирует одинаковые элементы в списке (если они идут подряд) и возвращает список таких групп.

GHCi> groupElems []
[]
GHCi> groupElems [1,2]
[[1],[2]]
GHCi> groupElems [1,2,2,2,4]
[[1],[2,2,2],[4]]
GHCi> groupElems [1,2,3,2,4]
[[1],[2],[3],[2],[4]]
Разрешается использовать только функции, доступные из библиотеки Prelude.

-}

module GroupElems where

groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs) = reverse (helper xs [x] [])
  where helper as a bs | null as = a:bs
                       | head as == head a = helper (tail as) (head as : a) bs
                       | otherwise = helper (tail as) ([head as]) (a : bs)



{- from haskage
groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems (x:xs) = (x : ys) : groupElems zs 
        where (ys,zs) = span (== x) xs
-}