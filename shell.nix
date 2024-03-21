{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    cmake
    clang-tools
    clang
    gnumake
  ];

  shellHook = ''
    echo NixOS environment
  '';
}
