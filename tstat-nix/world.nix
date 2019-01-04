{ compiler ? "ghc863" }:

let
  haskellOverlay = import ./haskell-overlay.nix { inherit compiler; };
in import <nixos-unstable> { overlays = [ haskellOverlay ]; }
