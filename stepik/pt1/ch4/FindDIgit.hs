{-
Реализуйте функцию, которая ищет в строке первое вхождение символа, который является цифрой, и возвращает Nothing, если в строке нет цифр.
-}

import Data.Char(isDigit)

findDigit :: [Char] -> Maybe Char
findDigit str | length str == 0 = Nothing
              | isDigit $ head str = Just (head str)
              | otherwise = findDigit (tail str)