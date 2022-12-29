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
  #networking.firewall.enable = true;
  #networking.firewall.allowedTCPPorts = [ 22 80 ];
  #networking.firewall.allowedUDPPorts = [ ];

  services.v2ray = {
    enable = true;
    configFile = toString ./v2ray.json;
  };
  networking.wireguard.interfaces = {
    wg0= {
      ips = [ "10.100.0.1/24" ];
      listenPort = 51820;
      postSetup = ''
                ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
                '';
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';
      privateKeyFile = "/etc/nixos/system/private";
      peers = [
       {
         publicKey = "k1aEyFLOBJt/2BvPkoYfjTfZnDzKb8IpbgpLEZUPgzA=";
         allowedIPs = ["10.100.0.2/32"];
         persistentKeepalive = 60;
         endpoint = "[2409:8a70:a4b:1bf0:12e7:ee97:5f90:52ee]:51820";
       }

     ];
    };
  };
}
