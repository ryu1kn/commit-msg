{-# LANGUAGE DeriveGeneric #-}

module Config (Config(..)) where

import GHC.Generics
import Data.Yaml

data Config = Config { authors :: Maybe [String]
                     , task_ids :: Maybe [String] } deriving (Show, Generic)

instance FromJSON Config
