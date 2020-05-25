{-# LANGUAGE DeriveGeneric #-}

module Param (Config(..), Param(..)) where

import GHC.Generics
import Data.Yaml

data Config = Config { authors :: Maybe [String]
                     , task_ids :: Maybe [String] } deriving (Show, Generic)

data Param = Param { config :: Config
                   , commit_source :: Maybe String } deriving (Show, Generic)

instance FromJSON Config
