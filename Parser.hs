module Parser where

import Types (TokenSymbol (..), Token (..), NodeAST (..))

-- TODO
   --[] function to build tree from Tokens using grammar 
   --[] function to evaluate tree

-- build abstract syntax tree from Tokens (from scanner), returns top node
{-
buildAST :: [Token] -> NodeAST
buildAST [] = []
buildAST (token:tokenLs) 
  | tokenVal token == INT_LIT

buildAST tokenList = NodeAST {nodeOp = PLUS, nodeIntVal = 4, left = NodeAST {nodeOp = PLUS, nodeIntVal = 0, left = NO_NODE, right = NO_NODE}, right = NodeAST {nodeOp = PLUS, nodeIntVal = 0, left = NO_NODE, right = NO_NODE}}
-}

-- checks that Tokens read in from scanner (in read order) conform to the
-- grammar of int op int (should define more generically and might combine
-- with the actual construction of the AST)
grammarCheck :: Token -> [Token] -> Bool
grammarCheck prevToken [] = True
grammarCheck prevToken (token:tokenLs)
  | tokenVal prevToken == NO_SYMBOL = grammarCheck token tokenLs
  | tokenVal token == INT_LIT && tokenVal prevToken /= INT_LIT = grammarCheck token tokenLs
  | tokenVal token /= INT_LIT && tokenVal prevToken == INT_LIT = grammarCheck token tokenLs
  | otherwise = False

