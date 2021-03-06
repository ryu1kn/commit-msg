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
                     , taskIds :: [String] } deriving (Show)

data Param = Param { config :: Config
                   , commitSource :: Maybe String } deriving (Show)

instance FromJSON Config where
    parseJSON = withObject "config" $ \o -> do
        authors <- o .:? "authors" .!= []
        taskIds <- (o .: "task_ids" >>= parseTaskIds) <|> return []
        return $ Config authors taskIds

parseTaskIds :: Value -> Parser [String]
parseTaskIds =
    withArray "array of task IDs" (mapM parseTaskId . V.toList)

parseTaskId :: Value -> Parser String
parseTaskId (String s) = return (T.unpack s)
parseTaskId (Number n) = return (either show show (floatingOrInteger n))
parseTaskId _          = mempty
