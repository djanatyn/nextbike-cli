{ sources ? import ./nix/sources.nix }:
let
  packages = import sources.nixpkgs { };
  inherit (packages) pkgs;
in rec {
  inherit sources pkgs;

  nextbike = pkgs.callPackage ./nextbike { };
}
