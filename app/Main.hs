module Main where

import Lib
import System.Environment (getArgs)
import qualified Data.ByteString.Char8 as C

main :: IO ()
main = do
    message_file <- head <$> getArgs
    contents <- C.readFile message_file
    C.writeFile message_file . C.pack . extendCommitMessage . C.unpack $ contents
