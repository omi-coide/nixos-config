{ pkgs, ... }:
{
  virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
  };
  environment.systemPackages = [ pkgs.virt-manager ];
}
