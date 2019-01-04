{ runCommand, cabal2nix, haskellLib }:

let genDerivation = pkgset: pth: args:
    let nexpr = runCommand "generate-cabal-nix" {
            buildInputs = [ cabal2nix ];
            src = pth;
          }
          ''
          mkdir -p $out
          cabal2nix $src > $out/default.nix
          '';
    in pkgset.callPackage "${nexpr}/default.nix" args;
in self: super: with haskellLib; with builtins;
  let genDrv = pth: args: genDerivation self pth args;
  in {
  servant =
    genDrv ../servant {};
  servant-server =
    genDrv ../servant-server {};
}
