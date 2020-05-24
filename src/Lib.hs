module Lib
    ( extendCommitMessage
    ) where

import Config
import Data.List

extendCommitMessage :: Config -> String -> String
extendCommitMessage conf msg =
  let header = prepopulated conf
      separator = if length header > 0 then "\n" else ""
   in header ++ separator ++ msg

prepopulated :: Config -> String
prepopulated = (++) <$> (groupValue . authors) <*> (groupValue . task_ids)

groupValue :: Maybe [String] -> String
groupValue = maybe "" groupedValue_
    where
        groupedValue_ :: [String] -> String
        groupedValue_ xs = if length xs > 0 then "[" ++ (intercalate "," xs) ++ "]" else ""
