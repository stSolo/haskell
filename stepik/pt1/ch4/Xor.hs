{-
Реализуйте представителя класса типов Monoid для типа Xor, в котором mappend выполняет операцию xor.
-}

import Data.Monoid

newtype Xor = Xor { getXor :: Bool }
    deriving (Eq,Show)

instance Monoid Xor where
    mempty = (Xor False)
    mappend (Xor x) (Xor y) | x == y = (Xor False)
                            | otherwise = (Xor True)