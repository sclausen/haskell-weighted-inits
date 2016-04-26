module ProgramOptions (
  options, Options(..)
) where

import           Data.Text.Read
import           Options.Applicative

data Options = Options
  { word      :: String
  , seed      :: Integer
  , bytes :: Maybe String }

options :: Parser (Maybe Options)
options = flag' Nothing (long "version" <> hidden) <|> (Just <$> options')
  where
    options' = Options
      <$> strOption
          ( long "word"
        <> short 'w'
        <> metavar "WORD"
        <> help "The word to print the inits of" )
      <*> option auto
          ( long "seed"
        <> short 's'
        <> metavar "SEED"
        <> help "The seed for the random function" )
      <*> optional (strOption
          ( long "bytes"
        <> short 'b'
        <> metavar "BYTES"
        <> help "Limit the output to BYTES" ))
