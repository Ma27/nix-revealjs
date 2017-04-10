{ DIRPresentation ? { outPath = ./.; name = "DIR"; }
, pkgs ? import <nixpkgs> {}
}:

let
  stdenv = pkgs.stdenv;
  buildBowerComponents = pkgs.buildBowerComponents;
in stdenv.mkDerivation {
  name = "bower-revealjs-DIR";
  src = DIRPresentation;

  bowerComponents = buildBowerComponents {
    name = "bower-revealjs-bowercmps-DIR";
    generated = ./bower-generated.nix;
    src = DIRPresentation;
  };

  buildPhase = ''
    cp --reflink=auto --no-preserve=mode -R $bowerComponents/bower_components .
    export HOME=$PWD
  '';

  installPhase = "mv bower_components $out";
}
