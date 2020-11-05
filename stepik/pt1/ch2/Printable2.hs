{-
Сделайте тип пары представителем класса типов Printable, реализованного вами в предыдущей задаче, обеспечив следующее поведение:

GHCi> toString (False,())
"(false,unit type)"
GHCi> toString (True,False)
"(true,false)"
Примечание. Объявление класса типов Printable и представителей этого класса для типов () и  Bool заново реализовывать не надо — они присутствуют в программе, вызывающей ваш код.
-}


class Printable a where
    toString :: a -> [Char]
 
instance Printable Bool where
    toString True = "true"
    toString False = "false"

instance Printable () where
    toString () = "unit type"

instance (Printable a, Printable b) => Printable (a,b) where
    toString p = "(" ++ (toString $ fst p) ++ "," ++ (toString $ snd p) ++ ")"