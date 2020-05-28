{-# LANGUAGE OverloadedStrings #-}

module Param (Config(..), Param(..)) where

import Control.Applicative
import Data.Aeson
import Data.Aeson.Types
import Data.Foldable
import Data.Scientific
import Data.Yaml
import GHC.Generics
import qualified Data.Text as T
import qualified Data.Vector as V

data Config = Config { authors :: [String]
                     , task_ids :: [String] } deriving (Show)

data Param = Param { config :: Config
                   , commit_source :: Maybe String } deriving (Show)

instance FromJSON Config where
    parseJSON = withObject "config" $ \o -> do
        authors <- o .:? "authors" .!= []
        taskIds <- asum [
              o .: "task_ids" >>= withArray "array of task IDs" (\arr -> mapM parseTaskId (V.toList arr))
            , o .:? "task_ids" .!= []
            ]
        return $ Config authors taskIds

parseTaskId :: Value -> Parser String
parseTaskId (String s) = return (T.unpack s)
parseTaskId (Number n) = return (either show show (floatingOrInteger n))
parseTaskId _          = mempty
