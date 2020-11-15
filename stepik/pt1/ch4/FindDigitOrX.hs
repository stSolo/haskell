{-
Реализуйте функцию findDigitOrX, использующую функцию findDigit (последнюю реализовывать не нужно). findDigitOrX должна находить цифру в строке, а если в строке цифр нет, то она должна возвращать символ 'X'. Используйте конструкцию case.
-}

import Data.Char(isDigit)

findDigit :: [Char] -> Maybe Char

findDigitOrX :: [Char] -> Char
findDigitOrX x = case findDigit x of 
         Nothing -> 'X'
         (Just c) -> c