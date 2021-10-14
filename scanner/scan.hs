import System.IO
import Data.Char (isDigit, digitToInt)

-- TODO
-- [x] read in file char by char
-- [x] check if char is a TokenSymbol
-- [x] check if char is digit
--    [x] build up an integer
-- [] put data in Token

data TokenSymbol = PLUS | MINUS | STAR | SLASH | INT_LIT | NONE deriving (Show)
data Token = Token {tokenVal :: TokenSymbol, intVal :: Int} deriving (Show)

-- given a string representation of integer, make it an actual Int
buildInt :: String -> Int
buildInt [] = 0
buildInt (x:xs) = (digitToInt x) * (10 ^ (length xs)) + buildInt xs

-- given a character from file, assign a Token list (of none or a singular Token) if a TokenSymbol match
processChar :: String -> [Token]
processChar char 
  | char == "+" = [Token {tokenVal = PLUS, intVal = 0}]
  | char == "-" = [Token {tokenVal = MINUS, intVal = 0}]
  | char == "*" = [Token {tokenVal = STAR, intVal = 0}]
  | char == "/" = [Token {tokenVal = SLASH, intVal = 0}]
  | all isDigit char = [Token {tokenVal = INT_LIT, intVal = (buildInt char)}]
  | otherwise = [] 

-- build an integer string until next character isnt a digit (using list concatenation)
buildIntStr :: String -> String 
buildIntStr [] = []
buildIntStr (x:xs)
  | isDigit x = [x] ++ buildIntStr xs
  | otherwise = []

-- given contents of file String, assign list of Tokens from characters
readTokens :: String -> [Token]
readTokens [] = []
readTokens (char:char_arr) 
  | isDigit char = processChar intStr ++ readTokens (drop (length intStr - 1) char_arr)
  | otherwise = processChar [char] ++ readTokens char_arr
  where intStr = buildIntStr (char:char_arr)

main = do
    file <- openFile "urmom.txt" ReadMode
    contents <- hGetContents file
    let res = readTokens contents
    print res
    --print (length res)
    hClose file
