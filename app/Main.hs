module Main where

import Lib
import Config
import System.Environment (getArgs)
import qualified Data.ByteString.Char8 as C
import Data.Yaml

main :: IO ()
main = do
    message_file <- head <$> getArgs
    contents <- byteReadFile message_file
    config <- decodeFileEither ".commit-msg.yaml" :: IO (Either ParseException Config)
    either (putStrLn . prettyPrintParseException) (updateFile message_file contents) config

updateFile :: FilePath -> String -> Config -> IO ()
updateFile message_file contents conf = byteWriteFile message_file . extendCommitMessage conf $ contents

byteReadFile :: FilePath -> IO String
byteReadFile = fmap C.unpack . C.readFile

byteWriteFile :: FilePath -> String -> IO ()
byteWriteFile path = C.writeFile path . C.pack
