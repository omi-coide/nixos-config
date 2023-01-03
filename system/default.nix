{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./base.nix
      ./fonts.nix
      ./i18n.nix
      ./desktop.nix
      ./network.nix
    ];
}
