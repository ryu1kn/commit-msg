module Main where

import Lib
import Config
import System.Environment (getArgs)
import qualified Data.ByteString.Char8 as C
import Data.Yaml

main :: IO ()
main = do
    message_file <- head <$> getArgs
    contents <- C.readFile message_file
    config <- decodeFileEither ".commit-msg.yaml" :: IO (Either ParseException Config)
    case config of
        Right conf -> C.writeFile message_file . C.pack . extendCommitMessage conf . C.unpack $ contents
        Left err -> putStrLn $ prettyPrintParseException err
