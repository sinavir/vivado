{ pkgs ? import ./nix/default.nix }:
pkgs.callPackage ./vivado-2022_2.nix {}
