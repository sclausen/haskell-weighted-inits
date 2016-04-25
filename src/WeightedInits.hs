module WeightedInits
    ( printWeightedInits
    , generateWeightedInits
    ) where

import           Control.Monad.Random (RandomGen, next)
import           Data.List            (inits)

getWeights :: (Enum a, Fractional a) => a -> [a]
getWeights count = map (/ sum [1..count]) [1..count]

getTuples :: String -> [(String, Float)]
getTuples string = zip (reverse strings) (getWeights (fromIntegral $ length strings))
  where
    strings = tail $ inits string

normalizedFloat :: Int -> Float
normalizedFloat i = fromIntegral (mod i 1000000) / 1000000.0

weightedPick :: Float -> [(String, Float)] -> String
weightedPick _ [] = ""
weightedPick rnd ((string, weight):xs)
  | rnd < weight = string
  | otherwise = weightedPick (rnd - weight) xs

generateWeightedInits :: (RandomGen g) => String -> g -> [String]
generateWeightedInits word g = pick:generateWeightedInits word g'
  where
    (i, g') = next g
    rnd = normalizedFloat i
    pick = weightedPick rnd (getTuples word)

printWeightedInits :: (RandomGen g) => String -> g -> IO()
printWeightedInits word g = putStr $ concat (generateWeightedInits word g)
