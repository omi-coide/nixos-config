{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./alias.nix
      ./zsh.nix
    ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.plasma5Packages.kdeconnect-kde; #pkgs.gnomeExtensions.gsconnect
  };
  
  programs.nix-ld.enable = true;

  programs.xonsh.enable = true;
  
  services.code-server.enable = true;
}
