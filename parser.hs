data NodeOp = ADD | SUB | MUL | DIV | AST_INT_LIT
data ASTnode = ASTnode {operator :: NodeOp, left :: ASTnode, right :: ASTnode, intVal :: Int}

