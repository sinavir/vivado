{ pkgs ? import ./nix/default.nix }:
let
  boards = pkgs.stdenv.mkDerivation {
    name = "digilent-boards";
    src = pkgs.fetchFromGitHub {
      owner = "Digilent";
      repo = "vivado-boards";
      rev = "e5f0728cd284d10080ae8eb03fc86e7b5eafcb72";
      hash = "sha256-tafHRfzQ0G8tq4sV8WRvwwRP4YAVIbVmq+xIp4+N4mE=";
    };
    installPhase = ''
      mkdir -p $out
      cp -r new/board_files/* $out/
      '';
  };
  buildFHSUserEnv = pkgs.callPackage ./fhsuserenv { };
in
pkgs.callPackage ./vivado-2022_2.nix { inherit boards buildFHSUserEnv; }
