module Scan where

import Data.Char (isDigit, digitToInt)
import Types (TokenSymbol (..), Token (..))

-- TODO
-- [x] read in file char by char
-- [x] check if char is a TokenSymbol
-- [x] check if char is digit
--    [x] build up an integer
-- [x] put data in Token

-- given a string representation of integer, make it an actual Int
buildInt :: String -> Int
buildInt [] = 0
buildInt (x:xs) = (digitToInt x) * (10 ^ (length xs)) + buildInt xs

{- given a str (might be single byte or entire literal value) from file, assign a 
   Token list (of none or a singular Token) if a TokenSymbol match
-}
processStr :: String -> [Token]
processStr str 
  | str == "+" = [Token {tokenVal = PLUS, tokenIntVal = 0}]
  | str == "-" = [Token {tokenVal = MINUS, tokenIntVal = 0}]
  | str == "*" = [Token {tokenVal = STAR, tokenIntVal = 0}]
  | str == "/" = [Token {tokenVal = SLASH, tokenIntVal = 0}]
  | all isDigit str = [Token {tokenVal = INT_LIT, tokenIntVal = (buildInt str)}]
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
  | isDigit char = processStr intStr ++ readTokens (drop (length intStr - 1) char_arr)
  | otherwise = processStr [char] ++ readTokens char_arr
  where intStr = buildIntStr (char:char_arr)

