{ config, pkgs, lib, ... }:
{
  nix = {
    package = pkgs.nixUnstable;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;

      substituters = [
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
      trusted-users = [ "root" "yly" ];
    };

    gc = {
      automatic = false;
      #options = "--delete-older-than 5d";
      #dates = "05:15";
    };

    #extraOptions = ''
    #  keep-outputs = true
    #  keep-derivations = true
    #'';
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    allowBroken = true;
    permittedInsecurePackages = [ "electron-9.4.4"  ]; #typora
  };
}
