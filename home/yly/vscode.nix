{ pkgs, ... }:
[
  # check https://nixos.wiki/wiki/Visual_Studio_Code
  (pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config ]))
  pkgs.clang-tools
]
