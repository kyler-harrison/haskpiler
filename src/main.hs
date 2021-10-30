import System.IO
import Types
import Scan
import Parser

main = do
    file <- openFile "simple.txt" ReadMode
    contents <- hGetContents file
    let tokens = readTokens contents
    let check = grammarCheck Token {tokenVal = NO_SYMBOL, tokenIntVal = 0}  tokens 
    let tree = buildAST NO_NODE tokens
    let eval = evaluateAST tree
    print tree
    print eval
    hClose file

