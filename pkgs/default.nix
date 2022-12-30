{ config, lib, pkgs, ... }:
let
  # python-with-my-packages = pkgs.callPackage ./python.nix { };
  # vscodium-with-extensions = pkgs.callPackage ./vscodium.nix { };
  # mynurpkgs = import ./nurpkgs.nix  { inherit pkgs; };
  build-tools = with pkgs; [
    cmake gcc gdb
    binutils
    #pkgsCross.aarch64-embedded.stdenv.cc
    #pkgsCross.riscv64.stdenv.cc pkgsCross.riscv64.binutils
    #clang clang-tools ninja 
    qt5Full qtcreator 
  ];

  nixpkgs-tools = with pkgs; [
    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
    nix-index
    nix-ld
    nixpkgs-pytools
    nix-du
    manix
  ];

  qt5-libs = with pkgs.libsForQt5; [
    yakuake
    gwenview
    ark #latte-dock
  ];

  gui-tools = with pkgs; [
    okular

    ghostwriter
    flameshot
    # Browser
  ];

  modern-unix = with pkgs; [
    file
    coreutils
    topgrade
    miller
  ];
in
{
  environment.systemPackages =
    #  mynurpkgs
    nixpkgs-tools
    ++ qt5-libs
    ++ gui-tools
    ++ modern-unix
    ++ build-tools
    ++ (with pkgs; [
      home-manager
      proxychains

      nitrogen
      xclip
      pineapple-pictures
      copyq #albert
      unrar
      pamixer # 音量控制
      scrot
      pipewire
      xorg.xmodmap
      termonad

      wget
      tmux
      man
      stow

      aria
      xdotool

    ]);
}
