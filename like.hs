import System.Environment
import ID3
import System.Console.ParseArgs 
-- (parseArgsIO, ArgsComplete, Arg, IOMode)
import Data.String.Utils (join)


argspec = [ Arg "directory" (Just 'd') (Just "directory") (argDataDefaulted "" ArgtypeString ".") "Search recursively starting at this directory"]

instance (Ord a, Show a) => Show (Args a) where
  show arg = join ", " $ map show [argsProgName arg, argsUsage arg, join ", " $ argsRest arg]


main :: IO ()
main = do
    args <- parseArgsIO ArgsComplete argspec
    putStrLn $ show args
    dir <- getArgFile args "directory" ReadMode
    putStrLn $ show dir
    -- args <- getArgs 
    -- (String -> IO ()) -> [String] -> IO [()]
    -- (String -> IO ()) -> [String] -> IO ()
    -- mapM_ $ putStrLn . map show args
    return ()
