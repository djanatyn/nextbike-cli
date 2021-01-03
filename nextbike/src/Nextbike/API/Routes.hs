-- |
-- Module: Nextbike.API.Types
-- Description: Exports Nextbike API Types.
--
-- This type represents API routes that are used by the client.
module Nextbike.API.Routes
  ( -- * https://webview.nextbike.net
    WebviewApi (..),

    -- * https://api.nextbike.net
    NextbikeApi (..),
  )
where

import Data.Aeson (FromJSON, ToJSON, Value, eitherDecode)
import qualified Data.ByteString.Lazy.Char8 as BSC
import Data.Coerce (coerce)
import Network.HTTP.Media hiding (Accept)
import qualified Network.HTTP.Media as M
import Nextbike.API.Types
  ( ApiKey,
    Mobile,
    Pin,
  )
import Servant.API
import Servant.API.Generic

data WebviewApi r = WebviewAPI
  {getApiKey :: r :- "getAPIKey.json" :> Get '[JSON] ApiKey}
  deriving (Generic)

data BikeJSON

instance MimeUnrender BikeJSON Value where
  mimeUnrender _ = eitherDecode

instance Accept BikeJSON where
  contentType _ = "application" // "json" /: ("", "")

data NextbikeApi r = NextbikeApi
  { nextbikeLogin ::
      r :- "login.json"
        :> QueryParam' '[Required] "apikey" ApiKey
        :> QueryParam' '[Required] "mobile" Mobile
        :> QueryParam' '[Required] "pin" Pin
        :> QueryParam' '[Required] "show_errors" Bool
        :> Post '[BikeJSON] Value
  }
  deriving (Generic)
