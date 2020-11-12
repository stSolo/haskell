{-
Тип LogLevel описывает различные уровни логирования.

data LogLevel = Error | Warning | Info
 

Определите функцию cmp, сравнивающую элементы типа LogLevel так, чтобы было верно, что Error > Warning > Info.

GHCi> cmp Error Warning
GT
GHCi> cmp Info Warning
LT
GHCi> cmp Warning Warning
EQ
-}

data LogLevel = Error | Warning | Info

cmp :: LogLevel -> LogLevel -> Ordering
cmp Error Error = EQ
cmp Error _ = GT
cmp _ Error = LT
cmp Warning Warning = EQ
cmp Info Info = EQ
cmp Info _ = LT
cmp _ Info = GT