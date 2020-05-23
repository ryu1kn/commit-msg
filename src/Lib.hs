module Lib
    ( extendCommitMessage
    ) where

import Config
import Data.List

extendCommitMessage :: Config -> String -> String
extendCommitMessage conf msg = "[" ++ (intercalate "," $ authors conf) ++ "]\n" ++ msg
