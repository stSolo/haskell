{-
Рассмотрим язык арифметических выражений, которые состоят из чисел, скобок, операций сложения и вычитания. Конструкции данного языка можно представить следующим типом данных:

data Token = Number Int | Plus | Minus | LeftBrace | RightBrace 
    deriving (Eq, Show)
Реализуйте лексер арифметических выражений. Для начала реализуйте следующую функцию:

asToken :: String -> Maybe Token

Она проверяет, является ли переданная строка числом (используйте функцию isDigit из модуля Data.Char), знаком "+" или "-", открывающейся или закрывающейся скобкой. Если является, то она возвращает нужное значение обёрнутое в Just, в противном случае - Nothing:

GHCi> asToken "123"
Just (Number 123)

GHCi> asToken "abc"
Nothing

Далее, реализуйте функцию tokenize:

tokenize :: String -> Maybe [Token]
Функция принимает на вход строку и если каждое слово является корректным токеном, то она возвращает список этих токенов, завёрнутый в Just. В противном случае возвращается Nothing. 

Функция должна разбивать входную строку на отдельные слова по пробелам (используйте библиотечную функцию words). Далее, полученный список строк должен быть свёрнут с использованием функции asToken и свойств монады Maybe:

GHCi> tokenize "1 + 2"
Just [Number 1,Plus,Number 2]

GHCi> tokenize "1 + ( 7 - 2 )"
Just [Number 1,Plus,LeftBrace,Number 7,Minus,Number 2,RightBrace]

GHCi> tokenize "1 + abc"
Nothing
Обратите внимание, что скобки отделяются пробелами от остальных выражений!
-}

import Text.Read (read)
import Data.Char (isDigit)


data Token = Number Int | Plus | Minus | LeftBrace | RightBrace     
     deriving (Eq, Show)

asToken :: String -> Maybe Token
asToken x = case x of
    "(" -> Just LeftBrace
    ")" -> Just RightBrace
    "+" -> Just Plus
    "-" -> Just Minus
    _ -> if all isDigit x then Just (Number ((read x)::Int)) else Nothing

maybefy [] = []
maybefy (x:xs) = (asToken x) : maybefy xs

checkMaybe x = any (==Nothing) x

doing :: [Maybe Token] -> Maybe [Token]
doing xs | checkMaybe xs = Nothing
         | otherwise = Just (extract xs)

extract :: [Maybe Token] -> [Token]
extract [] = []
extract ((Just x):xs) = x : extract xs

tokenize :: String -> Maybe [Token]
tokenize input = doing $ maybefy $ words input

{- best solution

-- data Token = Number Int | Plus | Minus | LeftBrace | RightBrace     
--     deriving (Eq, Show)
-- Тип Token уже объявлен, его писать не нужно

import Data.Char

asToken :: String -> Maybe Token
asToken "+" = Just Plus
asToken "-" = Just Minus
asToken "(" = Just LeftBrace
asToken ")" = Just RightBrace
asToken str | all isDigit str = Just $ Number $ read str
asToken _ = Nothing

tokenize :: String -> Maybe [Token]
tokenize input = foldr f (return []) (words input) where 
	f word list = do
		token <- asToken word
		tokens <- list
		return $ token : tokens


-}