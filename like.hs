{-# LANGUAGE DeriveDataTypeable #-}
import System.IO
import Control.Monad (when)
import System.FilePath.Find
import System.Environment
import System.Console.CmdArgs 
import System.Directory (doesDirectoryExist)
import System.Exit

data Like = Like
    {dir :: FilePath
    }
    deriving (Data, Typeable, Show, Eq)
like = Like{ dir = "." &= typ "DIRECTORY" }

dirExists :: FilePath -> IO ()
dirExists dir = do
    check <- doesDirectoryExist dir
    when (not check) $ do
      hPutStr stderr $ "directory " ++ dir ++ " does not exist"
      exitFailure

main :: IO ()
main = do
    args <- cmdArgs like
    dirExists $ dir args
    files <- find always (fileType ==? RegularFile) $ dir args
    mapM_ putStrLn files
