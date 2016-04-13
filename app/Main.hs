module Main where

import           Control.Monad.Random (mkStdGen)
import           System.Environment   (getArgs)
import           WeightedInits        (printWeightedInits)

main :: IO()
main = do
  [word, seed] <- getArgs
  printWeightedInits word (mkStdGen (read seed :: Int))
