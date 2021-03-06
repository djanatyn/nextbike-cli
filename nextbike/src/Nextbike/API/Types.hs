-- |
-- Module: Nextbike.API.Types
-- Description: Exports Nextbike API Types.
--
-- These types represent values that can be returned from the Nextbike API,
-- representing authentication, places, available bikes, and rentals.
module Nextbike.API.Types
  ( -- * Newtypes
    ApiKey (..),
    Mobile (..),
    Pin (..),

    -- * Account Login
    NextbikeLogin (..),
  )
where

import Data.Aeson (FromJSON (..), withObject, (.:))
import Data.Coerce (coerce)
import Data.String (IsString)
import Data.Text (Text)
import Servant.API (ToHttpApiData)

newtype ApiKey = ApiKey Text deriving (Show, ToHttpApiData, IsString) via Text

instance FromJSON ApiKey where
  parseJSON = withObject "response" $ \o -> do
    key <- o .: "apiKey"
    return $ ApiKey key

newtype Mobile = Mobile Text deriving (Show, ToHttpApiData, IsString) via Text

newtype Pin = Pin Int deriving (Show, ToHttpApiData, Num) via Int

data NextbikeLogin = NextbikeLogin
  { apiKey :: ApiKey,
    mobile :: Mobile,
    pin :: Pin
  }
  deriving (Show)
