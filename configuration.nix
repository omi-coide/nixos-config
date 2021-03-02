# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  extensions = (with pkgs.vscode-extensions; [
      bbenoist.Nix
      # ms-python.python
      # ms-azuretools.vscode-docker
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "remote-ssh-edit";
      publisher = "ms-vscode-remote";
      version = "0.47.2";
      sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    }
  ];
  vscodium-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };
  #vivaldi-with-ffmpeg = pkgs.vivaldi.override {
  #  proprietaryCodecs = true;
  #  vivaldi-ffmpeg-codecs = pkgs.vivaldi-ffmpeg-codecs;
  #  enableWidevine = true;
  #  vivaldi-widevine = pkgs.vivaldi-widevine;
  #};
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      ./sys
      ./sys/boot.nix
      ./sys/fonts.nix
      ./sys/gpu.nix
      ./sys/keyboard.nix
      ./sys/i18n.nix
      ./sys/desktop.nix
      ./sys/network.nix
      ./sys/users.nix
      ./sys/virtualisation.nix
      ./sys/auto.nix
      
      ./etc/alias.nix
      ./etc/zsh.nix
    ];

  nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
    };
  };  

  nixpkgs.config.vivaldi.proprietaryCodecs = true;

  environment.systemPackages = with pkgs; [
    alacritty dmenu picom nitrogen xmobar betterlockscreen albert
    libxfs xfsprogs 
    wget git tmux fzf man
    bpytop
    neofetch htop  
    lazygit  ranger
    netease-music-tui 
    vlc obs-studio 

    kdenlive
    gwenview
    ark latte-dock

    okular libreoffice typora #nur.picgo
    
    # text 
    neovim  
    emacs 
    zeal
    # code
    gcc gdb clang clang-tools cmake ninja 
    qtcreator libsForQt5.qt5.qtdoc libsForQt5.qt5.qtbase libsForQt5.qt5.qttools
    python3Full # python38Packages.pip
    lua5_3 ghc nodejs go 
    jdk jetbrains.idea-community

    vscode postman vscodium-with-extensions
    
    # network    
    v2ray qv2ray
    # Browser
    firefox 
    vivaldi-ffmpeg-codecs vivaldi-widevine
    vivaldi
    # AppImage  
    appimage-run
    # kvm
    qemu qemu_kvm virt-manager iproute
  ];  
}
