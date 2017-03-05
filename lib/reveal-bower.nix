{ DIRPresentation ? { outPath = ./.; name = "DIR"; }
, pkgs ? import <nixpkgs> {}
}:

pkgs.stdenv.mkDerivation {
  name = "bower-revealjs-DIR";
  src = DIRPresentation;

  bowerComponents = pkgs.buildBowerComponents {
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
