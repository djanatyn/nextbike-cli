-- |
-- Module: Nextbike.API.Client
-- Description: Exports a Nextbike API Client.
--
-- This module uses servant-client-generic to export a type that specifies that an
-- API record containing a set of routes also contains a client implementation,
-- which can be interpreted and executed.
module Nextbike.API.Client
  ( -- * Nextbike API Client
    nextbikeApi,
  )
where

import Network.HTTP.Client.TLS (newTlsManager)
import Servant.Client

nextbikeApi :: String -> BaseUrl
nextbikeApi = BaseUrl Https "api.nextbike.net" 443

loginApi :: String -> BaseUrl
loginApi = BaseUrl Https "webview.nextbike.net" 443
