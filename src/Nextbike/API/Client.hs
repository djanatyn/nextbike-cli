-- |
-- Module: Nextbike.API.Client
-- Description: Exports a Nextbike API Client.
--
-- This module uses servant-client-generic to export a type that specifies that an
-- API record containing a set of routes also contains a client implementation,
-- which can be interpreted and executed.
module Nextbike.API.Client
  ( -- * Clients
    webviewClient,
   
    -- * BaseUrls
    nextbikeApi,
  )
where

import Network.HTTP.Client.TLS (newTlsManager)
import Nextbike.API.Routes (WebviewAPI(..))
import Servant.Client
  ( BaseUrl(..),
    ClientM,
    Scheme (Https),
  )
import Servant.Client.Core (RunClient)
import Servant.Client.Generic (genericClient, AsClientT)

webviewClient :: RunClient m => WebviewAPI (AsClientT m)
webviewClient = genericClient @WebviewAPI

nextbikeApi :: String -> BaseUrl
nextbikeApi = BaseUrl Https "api.nextbike.net" 443

loginApi :: String -> BaseUrl
loginApi = BaseUrl Https "webview.nextbike.net" 443
