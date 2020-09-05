-- |
-- Module: Nextbike.API.Types
-- Description: Exports Nextbike API Types.
--
-- These types represent values that can be returned from the Nextbike API,
-- representing authentication, places, available bikes, and rentals.
module Nextbike.API.Types
  ( -- * User Type
    APIKey (..),
  )
where

import Data.Text (Text)

newtype APIKey = APIKey Text
