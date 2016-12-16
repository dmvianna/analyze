module Datasets where

import Analyze.Csv
import Analyze.RFrame (RFrame)
import Control.Monad.Catch (MonadThrow(..))
import qualified Data.ByteString.Lazy as LBS
import Data.Text (Text)
import qualified Data.Text as T

datasetWithHeader :: Text -> Text -> IO (RFrame Text Text)
datasetWithHeader a b = do
  let path = "datasets/" ++ T.unpack a ++ "/" ++ T.unpack b ++ ".csv"
  bs <- LBS.readFile path
  decodeWithHeader bs
