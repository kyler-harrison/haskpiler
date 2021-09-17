import System.IO

-- TODO figure out what the heck a do block does and how to handle IO
readChar :: Handle -> IO String
readChar file = line
    where line = hGetLine file

main :: IO ()
main = do
    file <- openFile "urmom.txt" ReadMode
    line <- readChar file
    putStrLn line
    hClose file
