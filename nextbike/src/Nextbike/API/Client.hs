{-# LANGUAGE TypeApplications #-}

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

    -- * Client Functions
    fetchApiKey,
    fetchSession,
  )
where

import Data.Aeson (Value)
import Network.HTTP.Client.TLS (newTlsManager)
import Nextbike.API.Routes
  ( NextbikeApi (..),
    WebviewApi (..),
  )
import Nextbike.API.Types
  ( ApiKey,
    Mobile,
    NextbikeLogin (..),
    Pin,
  )
import Servant.Client
  ( BaseUrl (..),
    ClientError,
    ClientM,
    Scheme (Https),
    mkClientEnv,
    runClientM,
  )
import Servant.Client.Core (RunClient)
import Servant.Client.Generic (AsClientT, genericClient)

webviewClient :: RunClient m => WebviewApi (AsClientT m)
webviewClient = genericClient @WebviewApi

nextbikeClient :: RunClient m => NextbikeApi (AsClientT m)
nextbikeClient = genericClient @NextbikeApi

nextbikeApi :: String -> BaseUrl
nextbikeApi = BaseUrl Https "api.nextbike.net" 443

loginApi :: String -> BaseUrl
loginApi = BaseUrl Https "webview.nextbike.net" 443

fetchApiKey :: IO (Either ClientError ApiKey)
fetchApiKey = do
  m <- newTlsManager
  runClientM (getApiKey webviewClient) $
    mkClientEnv m $ loginApi ""

fetchSession :: NextbikeLogin -> IO (Either ClientError Value)
fetchSession NextbikeLogin {apiKey, mobile, pin} = do
  m <- newTlsManager
  runClientM fetch $ mkClientEnv m $ nextbikeApi "api"
  where
    fetch = nextbikeLogin nextbikeClient apiKey mobile pin True
