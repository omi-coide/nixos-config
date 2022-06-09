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
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://berberman.cachix.org"
        "https://nixos-cn.cachix.org"
      ];
      trusted-public-keys = [
        "nixos-cn.cachix.org-1:L0jEaL6w7kwQOPlLoCR3ADx+E3Q8SEFEcB9Jaibl0Xg="
        "berberman.cachix.org-1:UHGhodNXVruGzWrwJ12B1grPK/6Qnrx2c3TjKueQPds="
      ];
      trusted-users = [ "root" "rewine" ];
    };

    gc = {
      # automatic = true;
      options = "--delete-older-than 5d";
      dates = "05:15";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    allowBroken = true;
    permittedInsecurePackages = [ "electron-9.4.4" ]; #typora
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
  };
}
