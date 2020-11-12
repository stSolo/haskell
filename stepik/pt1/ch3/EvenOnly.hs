{-
Используя однократный вызов свертки, реализуйте функцию evenOnly, которая выбрасывает из списка элементы, стоящие на нечетных местах, оставляя только четные.

GHCi> evenOnly [1..10]
[2,4,6,8,10]
GHCi> evenOnly ['a'..'z']
"bdfhjlnprtvxz"
-}

evenOnly :: [a] -> [a]
evenOnly = reverse . snd . foldl (\(n,ar) x -> (n+1,if even n then x:ar else ar)) (1,[])