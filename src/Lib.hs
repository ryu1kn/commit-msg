module Lib
    ( extendCommitMessage
    ) where

import Config
import Data.List

extendCommitMessage :: Config -> String -> String
extendCommitMessage conf msg = authorSection conf ++ taskIds conf ++ "\n" ++ msg

authorSection :: Config -> String
authorSection = groupedValue . authors

taskIds :: Config -> String
taskIds = maybe "" groupedValue . task_ids

groupedValue :: [String] -> String
groupedValue xs = if length xs > 0 then "[" ++ (intercalate "," xs) ++ "]" else ""
