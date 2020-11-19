{-
Ниже приведено определение класса MapLike типов, похожих на тип Map. Определите представителя MapLike для типа ListMap, определенного ниже как список пар ключ-значение. Для каждого ключа должно храниться не больше одного значения. Функция insert заменяет старое значение новым, если ключ уже содержался в структуре.
-}

import Prelude hiding (lookup)
import qualified Data.List as L

class MapLike m where
    empty :: m k v
    lookup :: Ord k => k -> m k v -> Maybe v
    insert :: Ord k => k -> v -> m k v -> m k v
    delete :: Ord k => k -> m k v -> m k v
    fromList :: Ord k => [(k,v)] -> m k v
    fromList [] = empty
    fromList ((k,v):xs) = insert k v (fromList xs)

newtype ListMap k v = ListMap { getListMap :: [(k,v)] }
    deriving (Eq,Show)

instance MapLike ListMap where
    empty = ListMap []
    lookup k (ListMap []) = Nothing
    lookup k (ListMap ((x,v):xs) ) | k == x = Just v
                        | otherwise = lookup k (ListMap xs)
    insert k v (ListMap []) = ListMap [(k,v)]
    insert k v (ListMap ((key,val):xs)) | k == key = ListMap ((key,v):xs)
                                        | otherwise = ListMap((key,val):l)
                                        where (ListMap l) = insert k v (ListMap xs)
    delete k (ListMap []) = empty
    delete k (ListMap ((key,val):xs)) | k == key = ListMap xs
                                      | otherwise = ListMap ((key,val):l)
                                      where (ListMap l) = delete k (ListMap xs)