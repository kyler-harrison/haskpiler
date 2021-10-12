import System.IO
import Data.Char (isDigit)

-- TODO
-- [] read in file char by char
-- [] check if char is a TokenSymbol
-- [] check if char is digit
--    [] build up an integer
-- [] put data in Token

data Token = Token {tokenVal :: String, intVal :: Int}
data TokenSymbol = PLUS | MINUS

readChar :: Handle -> IO String
readChar file = line
    where line = hGetLine file

main = do
    file <- openFile "urmom.txt" ReadMode
    line <- readChar file
    putStrLn line
    hClose file
