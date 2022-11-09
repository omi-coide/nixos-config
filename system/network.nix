{ ... }:

{
  networking.hostName = "yly-arch"; # Define your hostname.

  networking.networkmanager.enable = true;

  # use nmcil/nmtui to manager network 
  programs.nm-applet.enable = true;

  networking.iproute2.enable = true;

  # Configure network proxy
  # networking.proxy.default = "http://127.0.0.1:8889";
  # networking.proxy.allProxy = "http://127.0.0.1:8889";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  #networking.firewall.enable = true;
  #networking.firewall.allowedTCPPorts = [ 22 80 ];
  #networking.firewall.allowedUDPPorts = [ ];

}
