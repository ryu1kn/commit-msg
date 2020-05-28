{-# LANGUAGE OverloadedStrings #-}

module Param
    ( Config(..)
    , Param(..)
    )
where

import           Control.Applicative
import           Data.Aeson.Types
import           Data.Scientific
import           Data.Yaml
import           GHC.Generics
import qualified Data.Text                     as T
import qualified Data.Vector                   as V

data Config = Config { authors :: [String]
                     , task_ids :: [String] } deriving (Show)

data Param = Param { config :: Config
                   , commit_source :: Maybe String } deriving (Show)

instance FromJSON Config where
    parseJSON = withObject "config" $ \o -> do
        authors <- o .:? "authors" .!= []
        taskIds <- (o .: "task_ids" >>= parseTaskIds) <|> return []
        return $ Config authors taskIds

parseTaskIds :: Value -> Parser [String]
parseTaskIds =
    withArray "array of task IDs" (\arr -> mapM parseTaskId (V.toList arr))

parseTaskId :: Value -> Parser String
parseTaskId (String s) = return (T.unpack s)
parseTaskId (Number n) = return (either show show (floatingOrInteger n))
parseTaskId _          = mempty
