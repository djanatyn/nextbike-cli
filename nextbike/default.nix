{ zlib, haskellPackages }:

haskellPackages.mkDerivation rec {
  pname = "nextbike";
  version = "0.1.0.0";

  isLibrary = false;
  isExecutable = true;

  executableHaskellDepends = with haskellPackages; [
    cabal-install
    haskell-language-server

    base
    text
    bytestring
    http-client-tls
    http-media
    servant
    servant-client
    servant-client-core
    aeson
  ];

  src = builtins.path {
    path = ./.;
    name = pname;
  };

  license = "Unlicense";
}
