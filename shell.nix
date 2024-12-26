{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    buildInputs = [
        pkgs.imagemagick
        pkgs.jp2a
    ];
}
