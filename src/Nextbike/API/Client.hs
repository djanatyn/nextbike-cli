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
import Nextbike.API.Types (APIKey)
import Servant.Client
  ( BaseUrl(..),
    ClientM,
    ClientError,
    Scheme (Https),
    mkClientEnv,
    runClientM
  )
import Servant.Client.Core (RunClient)
import Servant.Client.Generic (genericClient, AsClientT)

webviewClient :: RunClient m => WebviewAPI (AsClientT m)
webviewClient = genericClient @WebviewAPI

nextbikeApi :: String -> BaseUrl
nextbikeApi = BaseUrl Https "api.nextbike.net" 443

loginApi :: String -> BaseUrl
loginApi = BaseUrl Https "webview.nextbike.net" 443

getAPIToken :: IO (Either ClientError APIKey)
getAPIToken = do
  m <- newTlsManager
  runClientM (getAPIKey webviewClient) $ mkClientEnv m $ loginApi ""
