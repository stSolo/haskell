{-
Используя однократный вызов свертки, реализуйте функцию evenOnly, которая выбрасывает из списка элементы, стоящие на нечетных местах, оставляя только четные.

GHCi> evenOnly [1..10]
[2,4,6,8,10]
GHCi> evenOnly ['a'..'z']
"bdfhjlnprtvxz"
-}

evenOnly :: [a] -> [a]
evenOnly = reverse . snd . foldl (\(n,ar) x -> (n+1,if even n then x:ar else ar)) (1,[])


{-
evenOnly = snd . foldr (\x (ar,ar2) -> ((x:ar2, ar))) ([],[])
-}


{-
evenOnly :: [a] -> [a]
evenOnly = (\(q, (a,a2)) -> if odd q then a2 else a) . foldr (\x (n,(ar,ar2)) -> (n+1,if even n then (x:ar, ar2) else (ar, x:ar2) )) (1,([],[]))
-}