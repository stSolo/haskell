{-
Исправьте определение функции expand

infixl 6 :+:
infixl 7 :*:
data Expr = Val Int | Expr :+: Expr | Expr :*: Expr
    deriving (Show, Eq)

expand :: Expr -> Expr
expand ((e1 :+: e2) :*: e) = expand e1 :*: expand e :+: expand e2 :*: expand e
expand (e :*: (e1 :+: e2)) = expand e :*: expand e1 :+: expand e :*: expand e2
expand (e1 :+: e2) = expand e1 :+: expand e2
expand (e1 :*: e2) = expand e1 :*: expand e2
expand e = e
так, чтобы она, используя дистрибутивность (а также, возможно, ассоциативность и коммутативность), всегда возвращала значение, эквивалентное данному и являющееся суммой произведений числовых значений. Например,

GHCi> expand $ (Val 1 :+: Val 2 :+: Val 3) :*: (Val 4 :+: Val 5)
Val 1 :*: Val 4 :+: (Val 1 :*: Val 5 :+: (Val 2 :*: Val 4 :+: (Val 2 :*: Val 5 :+: (Val 3 :*: Val 4 :+: Val 3 :*: Val 5))))
Примечание. Скобки в ответе могут быть расставлены по-другому или вообще отсутствовать, поскольку сложение ассоциативно. Слагаемые могут идти в другом порядке, поскольку сложение коммутативно.
-}

infixl 6 :+:
infixl 7 :*:
data Expr = Val Int | Expr :+: Expr | Expr :*: Expr
    deriving (Show, Eq)

expand :: Expr -> Expr
expand ((e1 :+: e2) :*: e) = expand (expand e1 :*: expand e) :+: expand(expand e2 :*: expand e)
expand (e :*: (e1 :+: e2)) = expand (expand e :*: expand e1) :+: expand(expand e :*: expand e2)
expand (e1 :+: e2) = expand e1 :+: expand e2
expand (e1 :*: e2) | (e1 == expand e1) && (e2 == expand e2) = e1 :*: e2
                   | otherwise = expand ( expand e1 :*: expand e2 )
expand e = e