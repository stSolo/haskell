{-
Реализуйте функцию parsePerson, которая разбирает строки вида firstName = John\nlastName = Connor\nage = 30 и возвращает либо результат типа Person, либо ошибку типа Error.

Строка, которая подается на вход, должна разбивать по символу '\n' на список строк, каждая из которых имеет вид X = Y. Если входная строка не имеет указанный вид, то функция должна возвращать ParsingError.
Если указаны не все поля, то возвращается IncompleteDataError.
Если в поле age указано не число, то возвращается IncorrectDataError str, где str — содержимое поля age.
Если в строке присутствуют лишние поля, то они игнорируются.
-}

import Data.Char
import Data.List.Split (splitOn)
import Text.Read

data Error = ParsingError | IncompleteDataError | IncorrectDataError String deriving Show

data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving Show

parsePerson :: String -> Either Error Person
parsePerson str = let
  parse str = checkParse $ map (splitOn " = ") (lines str)
  
  checkParse strs | length strs >= 3 = checkGrabsFields $ grabFields strs
                  | otherwise = Left IncompleteDataError
  
  grabFields [] = []
  grabFields (str:strs) =  case (str !! 0) of 
      "firstName" -> str : grabFields strs
      "lastName" -> str : grabFields strs
      "age" -> str : grabFields strs
      _ -> grabFields strs
  
  getValue (x:xs) fName | fName == x !! 0 = x !! 1
                        | otherwise = getValue xs fName
  
  checkGrabsFields strs | length strs == 3 = checkAge strs
                        | otherwise = Left ParsingError
  
  checkAge strs | all isDigit (getValue strs "age") = createPerson strs
                | otherwise = Left (IncorrectDataError (getValue strs "age"))
 
  createPerson strs = Right Person {
    firstName = getValue strs "firstName",
    lastName = getValue strs "lastName",
    age = read (getValue strs "age")
  } 

  in parse str



{-
parsePerson :: String -> Either Error Person
parsePerson str = let 
  parse str = checkParse (lines str)

  checkNull [] = True 
  checkNull (ar:ars) | length ar == 0 = False
                      | otherwise = checkNull ars

  checkParse strs | (length strs >= 3) && (checkNull strs) = checkSplit $ map (splitOn " = ") strs
                  | otherwise = Left IncompleteDataError

  personFields x | x !! 0 == "firstName" = True
                 | x !! 0 == "lastName" = True
                 | x !! 0 == "age" = True
                 | otherwise = False
  
  findField fs fName n | head (head fs) == fName = n
                       | otherwise = findField (tail fs) fName (n + 1)
  
  
  checkSplitNull [] = True
  checkSplitNull (ar:ars) | any (==0) (map length ar) = False
                          | otherwise = checkSplitNull ars

  checkSplit strs | all (==2) (map length strs) && checkSplitNull strs = checkDigit $ filter (personFields) strs
                  | otherwise = Left ParsingError

  checkDigit strs | all isDigit (strs !! (findField strs "age" 0) !! 1) = createPerson strs
                  | otherwise = Left (IncorrectDataError (strs !! (findField strs "age" 0) !! 1))

  createPerson strs = Right Person {                                  
    firstName = (strs !! (findField strs "firstName" 0) !! 1),
    lastName = (strs !!  (findField strs "lastName" 0)!! 1),
    age =  read (strs !! (findField strs "age" 0) !! 1)
  }
  
  
  in parse str

-}
{-
parsePerson :: String -> Either Error Person
parsePerson str = let 
   checkwords ws | length ws >= 3 = cData (map (splitOn " = ") ws)
                 | otherwise = Left IncompleteDataError
   
   checkField x | x !! 0 == "firstName" = True
                | x !! 0 == "lastName" = True
                | x !! 0 == "age" = True
                | otherwise = False

   cData ds | all (==2) (map length ds) =  checkData $ filter checkField ds
                | otherwise = Left ParsingError
   
   checkData ds | all (==2) (map length ds) = createPerson ds
                | otherwise = Left ParsingError
   
   findField fs fName n | fs !! n !! 0 == fName = n
                        | otherwise = findField fs fName n+1

   createPerson is | all isDigit (is !! (findField is "age" 0) !! 1) = Right Person {
                                                                  firstName = (is !! ((findField is "firstName" 0)) !! 1),
                                                                  lastName = (is !! (findField is "lastName" 0) !! 1),
                                                                  age =  read (is !! (findField is "age" 0) !! 1)
                                                                }
                   | otherwise = Left (IncorrectDataError (is !! (findField is "age" 0) !! 1))
  in checkwords (lines str)


-}
--all isDigit (ds !! 2 !! 2) = ds

{-
parsePerson :: String -> Either Error Person
parsePerson str = checkWords (lines str)
   where checkWords [ws] | length ws >= 3 = checkEq (words ws)
                       | otherwise = Left IncompleteDataError
                       where checkEq es | all (==3) (map length es) = createPerson es
                                        | otherwise = Left ParsingError
                                        where createPerson d | isDigit (d !! 2 !! 2) = Right Person {
                                                                  firstName = (d !! 0 !! 2),
                                                                  lastName = (d !! 1 !! 2),
                                                                  age =  digitToInt (d !! 2 !! 2)
                                                                }
                                                             | otherwise = Left (IncorrectDataError (d !! 2 !! 2))
-}