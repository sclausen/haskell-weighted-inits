module Main where

import           Control.Monad.Random (mkStdGen)
import           Data.Either
import           Data.Version         (showVersion)
import           Options.Applicative  (execParser, fullDesc, header, helper,
                                       info, progDesc, (<>))
import           Parser               (bytes)
import           Paths_weighted_inits (version)
import qualified ProgramOptions       as PO
import           System.Environment   (getArgs)
import           System.IO            (writeFile)
import           WeightedInits        (generateWeightedInits,
                                       printWeightedInits)

main :: IO ()
main = execParser opts >>= main'
  where
    opts = info (helper <*> PO.options)
      ( fullDesc
     <> progDesc "Print the word WORD seeded by SEED. Optionally \
                 \limit the output to MEGABYTES"
     <> header "weighted-inits - print the inits of a word linear weighted \
               \by their position")

main' :: Maybe PO.Options -> IO ()
main' (Just (PO.Options word seed maybeSize)) =
  case maybeSize of
    Just size -> putStr $ take (fromIntegral $ bytes size) weightedInits
    Nothing -> putStr weightedInits
  where
    g = mkStdGen $ fromIntegral seed
    weightedInits = concat $ generateWeightedInits word g
main' Nothing = putStrLn $ showVersion version
