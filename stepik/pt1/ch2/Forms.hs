{-
NF
43
(1,2)
\x -> x + 32
-}

{-
non NF
"Hi " ++ "world"
sin (pi / 2)
(\x -> x + 4) 5
(3, 1 + 5)
-}

{-
WHNF
\x -> x + 2*3
(3, 1 + 5)
(,) (4+5)
(+) (7^2) - inner function
-- self-writed function isn't in WHNF
-}