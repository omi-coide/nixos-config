{ config, lib, pkgs, ... }:

{
  networking.hostName = "yly-arch"; # Define your hostname.

  networking.networkmanager.enable = true;

  # use nmcil/nmtui to manager network 
  programs.nm-applet.enable = true;

  networking.iproute2.enable = true;

  # Configure network proxy
  networking.proxy.default = "http://127.0.0.1:12333";
  networking.proxy.allProxy = "http://127.0.0.1:12333";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  networking.firewall.enable = false;
  #networking.firewall.allowedTCPPorts = [ 22 80 ];
  #networking.firewall.allowedUDPPorts = [ ];

  services.v2ray = {
    enable = true;
    configFile = toString ../secrets/v2ray.json;
  };
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
  };
  # for remote usage
  services.xrdp = {
    enable = true;
    defaultWindowManager = "icewm";
    openFirewall = true;
  };
  services.xserver.windowManager.icewm.enable = true;
  services.nfs.server = {
    enable = true;
    exports = ''
      /home/yly       192.168.1.0/24(rw,sync)
    '';
  };

}
