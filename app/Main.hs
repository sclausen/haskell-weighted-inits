module Main where

import           Control.Monad.Random (mkStdGen)
import           Data.Maybe
import           Data.Version         (showVersion)
import           Options.Applicative
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
main' (Just (PO.Options word seed maybeMegaBytes)) =
  case maybeMegaBytes of
    Just megaBytes -> putStr $ take (fromIntegral megaBytes * 1048576) weightedInits
    Nothing -> putStr weightedInits
  where
    g = mkStdGen $ fromIntegral seed
    weightedInits = concat $ generateWeightedInits word g
main' Nothing = putStrLn $ showVersion version
