{ config, lib, pkgs, ... }:

{
  networking.hostName = "aemaeth-laptop"; # Define your hostname.

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
    enable = false;
    configFile = toString ./v2ray.json;
  };
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
  };
  services.qbittorrent = {
    enable = true;
    port = 10080;
    settings = {
      LegalNotice = {
        Accepted = true;
      };
      BitTorrent = {
        "Session\\PieceExtentAffinity" = true;
        "Session\\Port" = 39603;
      };
      Preferences = {
        "Advanced\\AnonymousMode" = false;
        "Advanced\\osCache" = false;
        "Bittorrent\\Encryption" = 0;
        "Bittorrent\\LSD" = false;
        "Bittorrent\\MaxConnecs" = 10000;
        "Bittorrent\\MaxConnecsPerTorrent" = 1000;
        "Bittorrent\\MaxRatio" = 1000;
        "Bittorrent\\MaxUploads" = 1000;
        "Bittorrent\\MaxUploadsPerTorrent" = 100;
        "Connection\\GlobalUPLimit" = 8192;
        "Connection\\PortRangeMin" = config.services.qbittorrent.settings.BitTorrent."Session\\Port";
        "Connection\\ResolvePeerCountries" = true;
        "Connection\\UPnP" = false;
        "Downloads\\SavePath" = "/home/yly/Downloads";
        "Downloads\\StartInPause" = true;
        "Queueing\\MaxActiveDownloads" = 1;
        "Queueing\\MaxActiveTorrents" = 1000;
        "Queueing\\MaxActiveUploads" = 1000;
        "Queueing\\QueueingEnabled" = true;
        "WebUI\\AuthSubnetWhitelist" = "192.168.1.0/24";
        "WebUI\\AuthSubnetWhitelistEnabled" = true;
        "WebUI\\LocalHostAuth" = false;
        "WebUI\\Username" = "admin";
        "WebUI\\UseUPnP" = false;
        "WebUI\\Address" = "0.0.0.0";
      };
    };
    user = "yly";
    group = "users";


  };
  services.duckdns = {
    enable = true;
    token = (import ../secrets/secrets.nix).duckdns_token;
    domain = "nixlac";
  };
}
