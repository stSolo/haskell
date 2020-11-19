{-
Реализуйте представителя класса типов Monoid для Maybe' a так, чтобы mempty не был равен Maybe' Nothing. Нельзя накладывать никаких дополнительных ограничений на тип a, кроме указанных в условии.
-}

import Data.Monoid

newtype Maybe' a = Maybe' { getMaybe :: Maybe a }
    deriving (Eq,Show)

instance Monoid a => Monoid (Maybe' a) where
    mempty = Maybe' (Just mempty)
    mempty `mappend` (Maybe' Nothing) = Maybe' Nothing
    (Maybe' Nothing) `mappend` mempty = Maybe' Nothing
    (Maybe' (Just x) ) `mappend` (Maybe' (Just y) ) = Maybe' (Just (x `mappend` y))