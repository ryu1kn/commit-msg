module Lib
    ( extendCommitMessage
    ) where

import Config
import Data.List

extendCommitMessage :: Config -> String -> String
extendCommitMessage conf msg =
  let header = (++) <$> authorSection <*> taskIds $ conf
      separator = if length header > 0 then "\n" else ""
   in header ++ separator ++ msg

authorSection :: Config -> String
authorSection = maybe "" groupedValue . authors

taskIds :: Config -> String
taskIds = maybe "" groupedValue . task_ids

groupedValue :: [String] -> String
groupedValue xs = if length xs > 0 then "[" ++ (intercalate "," xs) ++ "]" else ""
