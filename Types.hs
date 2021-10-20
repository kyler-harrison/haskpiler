module Types (TokenSymbol (..), Token (..), NodeAST (..)) where

data TokenSymbol = PLUS | MINUS | STAR | SLASH | INT_LIT | NO_SYMBOL deriving (Eq, Show)
data Token = Token {tokenVal :: TokenSymbol, tokenIntVal :: Int} deriving (Show)
data NodeAST = NodeAST {nodeOp :: TokenSymbol, nodeIntVal :: Int, left :: NodeAST, right :: NodeAST} | NO_NODE deriving (Show)
