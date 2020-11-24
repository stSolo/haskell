{-
Реализуйте функцию local' из прошлого задания.

Считайте, что монада Reader определена так, как на видео:

data Reader r a = Reader { runReader :: (r -> a) }

instance Monad (Reader r) where
  return x = Reader $ \_ -> x
  m >>= k  = Reader $ \r -> runReader (k (runReader m r)) r
-}




import System.Directory
import Data.List
import Control.Monad (liftM)


--main' :: IO ()
main' = do 
    putStr "Substring: "
    substr <- getLine
    if substr == "" then putStrLn "Canceled"
    else  do
        files <- liftM (filter (isInfixOf substr)) $ getDirectoryContents $ "."
        z <- mapM_ rmFiles files
        return z

rmFiles path = do
    putStrLn $ "Removing file: " ++ path
    removeFile path