module Lib
    ( extendCommitMessage
    )
where

import           Param
import           Data.List

extendCommitMessage :: Param -> String -> String
extendCommitMessage param msg = case commitSource param of
    Nothing ->
        let header    = prepopulated $ config param
            separator = if length header > 0 then "\n" else ""
        in  header ++ separator ++ msg
    Just _ -> msg

prepopulated :: Config -> String
prepopulated = (++) <$> (groupValue . authors) <*> (groupValue . taskIds)

groupValue :: [String] -> String
groupValue xs =
    if length xs > 0 then "[" ++ (intercalate "," xs) ++ "]" else ""
