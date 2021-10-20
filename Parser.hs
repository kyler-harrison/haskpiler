module Parser where

import Types (TokenSymbol (..), Token (..), NodeAST (..))

{- TODO
   [] function to build tree from Tokens using grammar 
   [] function to evaluate tree
-}

-- build abstract syntax tree from Tokens (from scanner), returns top node
buildAST :: [Token] -> NodeAST
buildAST tokenLs = NodeAST {nodeOp = PLUS, nodeIntVal = 0, left = NO_NODE, right = NO_NODE}
