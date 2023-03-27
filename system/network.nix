{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.

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
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "192.168.1.24/32" ];
      listenPort = 51820;
      privateKeyFile = "/key/private";
      peers = [
        {
          publicKey = "W2N2uDC8HGNy8Li0O6XwELeNOlIdJEfCneiuSjrekRc=";
          allowedIPs = [ "192.168.1.192/32" ];
          endpoint = "hitlug.duckdns.org:30081";
          persistentKeepalive = 30;
        }
      ];

    };

  };
}
