{ myWebApp ? { outPath = ./.; name = "myWebApp"; }
, pkgs ? import <nixpkgs> {}
}:

pkgs.stdenv.mkDerivation {
  name = "my-web-app-frontend";
  src = myWebApp;

  buildInputs = [ pkgs.nodePackages.gulp ];

  bowerComponents = pkgs.buildBowerComponents {
    name = "my-web-app";
    generated = ./bower-generated.nix;
    src = myWebApp;
  };

  buildPhase = ''
    cp --reflink=auto --no-preserve=mode -R $bowerComponents/bower_components .
    export HOME=$PWD
  '';

  installPhase = "mv bower_components $out";
}
