-- |
-- Module: Nextbike.API.Types
-- Description: Exports Nextbike API Types.
--
-- These types represent values that can be returned from the Nextbike API,
-- representing authentication, places, available bikes, and rentals.
module Nextbike.API.Types
  ( -- * User Type
    ApiKey (..),
  )
where

import Data.Aeson (FromJSON (..), withObject, (.:))
import Data.Coerce (coerce)
import Data.Text (Text)

newtype ApiKey = ApiKey Text deriving (Show)

instance FromJSON ApiKey where
  parseJSON = withObject "response" $ \o -> do
    key <- o .: "apiKey"
    return $ ApiKey key
