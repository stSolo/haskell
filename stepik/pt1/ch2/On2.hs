on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
on op f x y = f x `op` f y