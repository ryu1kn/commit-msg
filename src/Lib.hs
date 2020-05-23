module Lib
    ( extendCommitMessage
    ) where

extendCommitMessage :: String -> String
extendCommitMessage = (++) "[ryuichi]\n"
