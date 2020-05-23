{-# LANGUAGE DeriveGeneric #-}

module Config (Config(..)) where

import GHC.Generics
import Data.Yaml

data Config = Config { authors :: [String] } deriving (Show, Generic)

instance FromJSON Config
