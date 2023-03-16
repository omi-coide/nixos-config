# this file contains packages that don't hava programs.* options for configuration
{ pkgs, nur }:
let
  cli-utils = with pkgs; [
    # unix tools
    htop
    ugrep
    ripgrep
    fd
    libtree # ldd as a tree
    tldr
    duf # replace du and df
    ncdu # NCurses Disk Usage
    pstree
    cloc # Lines of Code
    # nix tools
    nix-index
    nix-update
    nil
    sqlite-interactive
    v2ray
    screen
    appimage-run
    nix-ld
    steam-run
    rlwrap
    git-crypt

  ];
  development-tools = with pkgs; [
    coq
    python3

  ];
  unfree-pro-softwares = with pkgs;[
    quartus-prime-lite
    wpsoffice
    vscode
    nur.mathematica
  ];
  graphical = with pkgs; [

    colorpicker
    briss # java program to crop pdf books
    firefox
    glxinfo
    imagemagick
    qbittorrent
    rclone-browser
    remmina
    tdesktop
    tigervnc
    vlc
    audacity
    wine
    winetricks
    usbutils
    novnc
    killall
    rclone
    freerdp
    xrdp
    vnote
  ];
  games = with pkgs; [ yuzu ppsspp nur.vita3k ];
  network = with pkgs;[ bind whois ];
in
cli-utils ++ development-tools ++ games ++ unfree-pro-softwares ++ graphical ++ network
