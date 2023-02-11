{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./base.nix
      ./i18n.nix
      ./network.nix
    ];
}
