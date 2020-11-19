{-
3 из 6 баллов  получено
Реализуйте фукцию bindLog

bindLog :: Log a -> (a -> Log b) -> Log b
которая работает подобно оператору >>= для контекста Log.

GHCi> Log ["nothing done yet"] 0 `bindLog` add1Log
Log ["nothing done yet","added one"] 1

GHCi> Log ["nothing done yet"] 3 `bindLog` add1Log `bindLog` mult2Log
Log ["nothing done yet","added one","multiplied by 2"] 8
-}

bindLog :: Log a -> (a -> Log b) -> Log b
bindLog (Log x z) f = Log (x ++ str2) x2
 where Log str2 x2 = f z


{-

execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
execLoggers x f g = Log (str1 ++ str2 ) x2    where
    Log str1 x1 = f x
    Log str2 x2 = g x1

-}