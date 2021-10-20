module Types (TokenSymbol (..), Token (..), NodeAST (..)) where

data TokenSymbol = PLUS | MINUS | STAR | SLASH | INT_LIT | NONE deriving (Show)
data Token = Token {tokenVal :: TokenSymbol, tokenIntVal :: Int} deriving (Show)
data NodeAST = NodeAST {nodeOp :: Token, nodeIntVal :: Int, left :: NodeAST, right :: NodeAST}
