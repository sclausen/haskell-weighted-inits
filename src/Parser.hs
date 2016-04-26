module Parser
    ( pSi
    , bytes
    ) where


import           Data.Maybe                    (fromMaybe)
import qualified Text.Parsec                   as P
import qualified Text.ParserCombinators.Parsec as P


bytes :: String -> Integer
bytes string = case P.parse pSi "" string of
  Left err  -> 0
  Right res  -> fromMaybe 0 res

pSi :: P.Parser (Maybe Integer)
pSi =
  do
    integer <- P.many P.digit
    string <- P.many P.letter
    case string of
      "KB" -> pure $ Just (read integer * 1000)
      "K" -> pure $ Just (read integer * 1024)
      "MB" -> pure $ Just (read integer * 1000 ^ 2)
      "M" -> pure $ Just (read integer * 1024 ^ 2)
      "GB" -> pure $ Just (read integer * 1000 ^ 3)
      "G" -> pure $ Just (read integer * 1024 ^ 3)
      _ -> fail "You provided a malicious parameter for --bytes, -b"
