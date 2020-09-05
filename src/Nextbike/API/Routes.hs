-- |
-- Module: Nextbike.API.Types
-- Description: Exports Nextbike API Types.
--
-- This type represents API routes that are used by the client.
module Nextbike.API.Routes
  ( -- * https://webview.nextbike.net
    WebviewAPI (..),
  )
where

import Nextbike.API.Types (APIKey)
import Servant.API
import Servant.API.Generic

data WebviewAPI r = WebviewAPI
  {getAPIKey :: r :- "getAPIKey.json" :> Get '[JSON] APIKey}
  deriving (Generic)
