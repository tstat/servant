{ compiler ? "ghc863" }:

let pkgs = import ./tstat-nix/world.nix { inherit compiler; };
    ghc = pkgs.haskell.packages.${compiler}.ghcWithPackages
    (hpkgs: with hpkgs; [
    servant
    servant-server
    ]);
in pkgs.stdenv.mkDerivation {
  name = "servant-dev";
  buildInputs = [
  ghc
  ];
}
