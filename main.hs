import System.IO
import Types
import Scan
import Parser

main = do
    file <- openFile "valid.txt" ReadMode
    contents <- hGetContents file
    let tokens = readTokens contents
    print tokens
    let check = grammarCheck Token {tokenVal = NO_SYMBOL, tokenIntVal = 0}  tokens 
    --let output = buildAST (readTokens contents)
    print check
    hClose file

