module Main where

import           Lib
import           Param
import           System.Environment             ( getArgs )
import qualified Data.ByteString.Char8         as C
import           Data.Yaml

main :: IO ()
main = do
    (messageFile, commitSource) <- oneOrTwo <$> getArgs
    contents                    <- byteReadFile messageFile
    config                      <-
        decodeFileEither ".commit-msg.yaml" :: IO (Either ParseException Config)
    either (putStrLn . prettyPrintParseException)
           (byteWriteFile messageFile . editMessage contents)
           (flip Param commitSource <$> config)

oneOrTwo :: [a] -> (a, Maybe a)
oneOrTwo (x1      : []) = (x1, Nothing)
oneOrTwo (x1 : x2 : _ ) = (x1, Just x2)

editMessage :: String -> Param -> String
editMessage = flip extendCommitMessage

byteReadFile :: FilePath -> IO String
byteReadFile = fmap C.unpack . C.readFile

byteWriteFile :: FilePath -> String -> IO ()
byteWriteFile path = C.writeFile path . C.pack
