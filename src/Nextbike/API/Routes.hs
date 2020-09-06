-- |
-- Module: Nextbike.API.Types
-- Description: Exports Nextbike API Types.
--
-- This type represents API routes that are used by the client.
module Nextbike.API.Routes
  ( -- * https://webview.nextbike.net
    WebviewApi (..),
  )
where

import Nextbike.API.Types (ApiKey)
import Servant.API
import Servant.API.Generic

data WebviewApi r = WebviewAPI
  {getApiKey :: r :- "getAPIKey.json" :> Get '[JSON] ApiKey}
  deriving (Generic)
