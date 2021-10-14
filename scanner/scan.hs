import System.IO
import Data.Char (isDigit)

-- TODO
-- [x] read in file char by char
-- [] check if char is a TokenSymbol
-- [] check if char is digit
--    [] build up an integer
-- [] put data in Token

data TokenSymbol = PLUS | MINUS | STAR | SLASH | INT_LIT | NONE deriving (Show)
data Token = Token {tokenVal :: TokenSymbol, intVal :: Int} deriving (Show)

-- given a character from file, assign a Token list if a TokenSymbol match
processChar :: Char -> Token
processChar char 
  | char == '+' = Token {tokenVal = PLUS, intVal = 0}
  | char == '-' = Token {tokenVal = MINUS, intVal = 0}
  | char == '*' = Token {tokenVal = STAR, intVal = 0}
  | char == '/' = Token {tokenVal = SLASH, intVal = 0}
  | otherwise = Token {tokenVal = NONE, intVal = 0}

-- given contents of file String, assign list of Tokens from characters
readTokens :: String -> [Token]
readTokens [] = []
readTokens (char:char_arr) = [processChar char] ++ readTokens char_arr

main = do
    file <- openFile "urmom.txt" ReadMode
    contents <- hGetContents file
    let res = readTokens contents
    print res
    --print (length res)
    hClose file
