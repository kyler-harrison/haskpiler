module Parser where

import Types (TokenSymbol (..), Token (..), NodeAST (..))

-- TODO
   --[x] function to build tree from Tokens using grammar 
   --[] function to evaluate tree

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

-- build abstract syntax tree from Tokens (from scanner), assumes input has been checked for grammar, returns top node
buildAST :: NodeAST -> [Token] -> NodeAST
buildAST prevNode [] = prevNode
buildAST prevNode (token:tokenLs) 
  | tokenVal token == INT_LIT = buildAST NodeAST {nodeOp = tokenVal token, nodeIntVal = tokenIntVal token, left = NO_NODE, right = NO_NODE} tokenLs
  | tokenVal token /= INT_LIT = NodeAST {nodeOp = tokenVal token, nodeIntVal = 0, left = prevNode, right = buildAST NO_NODE tokenLs}  -- TODO should handle each operator with its own guard instead of just "not int"


