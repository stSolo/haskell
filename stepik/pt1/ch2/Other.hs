{-
curry id = (,)
uncurry (flip const) = snd
swap p = uncurry(flip (,)) p

-}