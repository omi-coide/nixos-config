{ config, lib, pkgs, ... }:
let
  build-tools = with pkgs; [
    cmake
    gcc
    gdb
    binutils
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
      xorg.xmodmap
      termonad

      wget
      tmux
      man
      stow

      aria
      xdotool


      xfce.xfce4-whiskermenu-plugin
    ]);
}
