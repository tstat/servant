{ compiler }:

self: super:
{
  haskell = super.haskell // {
    packages = super.haskell.packages // {
      "${compiler}" = super.haskell.packages."${compiler}".override {
        overrides = import ./haskell-overrides.nix { runCommand = super.runCommand;
                                                     cabal2nix = super.cabal2nix;
                                                     haskellLib = super.haskell.lib;
                                                   };
      };
    };
  };
}
