module Main where

import           WeightedInits
import           System.Environment
import           Control.Monad.Random (mkStdGen)

main :: IO()
main = do
  [word, seed] <- getArgs
  printWeightedInits word (mkStdGen (read seed :: Int))