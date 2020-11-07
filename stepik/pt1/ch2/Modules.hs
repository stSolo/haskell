-- Module def in () - export funcs
module Demo (f1, f2)  where

-- import
import Data.Char

-- import funcs
import Data.List (union)

--import excluding
import Data.Set hiding (union)

-- import with full-name and alias
import qualified Data.Array as Array

f1 = 1 + 3
f2 = 4 + 5
f3 = 3 + 1