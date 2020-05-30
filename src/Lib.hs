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
            separator = if not (null header) then "\n" else ""
        in  header ++ separator ++ msg
    Just _ -> msg

prepopulated :: Config -> String
prepopulated = (++) <$> (groupValue . authors) <*> (groupValue . taskIds)

groupValue :: [String] -> String
groupValue xs =
    if not (null xs) then "[" ++ intercalate "," xs ++ "]" else ""
