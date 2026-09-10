{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShellNoCC {
  buildInputs = [
    pkgs.typstyle
  ];

  shellHook = ''
    alias fmt="typstyle -i ./**/*.typ"
  '';
}