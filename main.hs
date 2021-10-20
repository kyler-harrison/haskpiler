import System.IO
import Scan
import Parser

main = do
    file <- openFile "urmom.txt" ReadMode
    contents <- hGetContents file
    let res = readTokens contents
    print res
    hClose file

