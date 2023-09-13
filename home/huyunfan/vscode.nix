{ pkgs, ... }:
[
  # check https://nixos.wiki/wiki/Visual_Studio_Code
  (with pkgs;(vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      ms-vscode-remote.remote-ssh
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "haskell";
        publisher = "haskell";
        version = "2.2.2";
        sha256 = "1d5b0p6r9ipwb7j4cx9w13vq31h78bh2sfwl54xri4gyvialhryd";
      }
      {
        name = "verilog-formatter";
        publisher = "IsaacT";
        version = "1.0.0";
        sha256 = "1n1wn5hdi4kcv6z55d42np0pnn7q8r2zcq4as0ajv903p5c7lb85";
      }
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.2.1";
        sha256 = "0bibb3r4cb7chnx6vpyl41ig12pc0cbg0sb8f2khs52c71nk4bn8";
      }
      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.6.0";
        sha256 = "115y86w6n2bi33g1xh6ipz92jz5797d3d00mr4k8dv5fz76d35dd";
      }
      {
        name = "direnv";
        publisher = "mkhl";
        version = "0.10.1";
        sha256 = "0m89sx1qqdkwa9pfmd9b11lp8z0dqpi6jn27js5q4ymscyg41bqd";
      }
      {
        name = "vscode-typescript-next";
        publisher = "ms-vscode";
        version = "5.1.20230313";
        sha256 = "02l8i2vwj5a4q2j3v3mkgal3r8r3yh7frjbb2zzyqib3m72gh5fr";
      }
      {
        name = "veriloghdl";
        publisher = "mshr-h";
        version = "1.11.1";
        sha256 = "0hqshjkriv5ln72fizgdwjm070ifgv8izs9d16ln5rnlip91gadm";
      }
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1438";
        sha256 = "sha256-I8pFJhvkLcs/dXNxohuA5jSkK7T/BvoUKUUnTltEmoE=";
      }
      {
        name = "vscode-typescript-vue-plugin";
        publisher = "Vue";
        version = "1.3.2";
        sha256 = "sha256-AaM9GVNkpAHPy7aoCQv5zULxhEqou08N3XFx9Zv5VSo=";
      }
      {
        name = "volar";
        publisher = "Vue";
        version = "1.3.2";
        sha256 = "sha256-hO1wmfi1T1ORlegZ6TXW864XNIBJKPftP2+W5veekR4=";
      }
      {
        name = "vscode-clangd";
        publisher = "llvm-vs-code-extensions";
        version = "0.1.23";
        sha256 = "sha256-3tX9ySsSsoIKUnpsuOaeQNrPghJ6xIhzRMhYojmzsYg=";
      }
      {
        name = "satysfi-workshop";
        publisher = "pickoba";
        version = "1.4.0";
        sha256 = "sha256-DgzEcxOCEIKMpbcP7lL5PTg5QyCBrW6dQ1iypDmvNyc=";
      }
    ];
  }))
  pkgs.clang-tools
]
