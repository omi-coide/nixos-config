{ ... }:

{
  networking.hostName = "nixos"; # Define your hostname.

  # Enables wireless support via wpa_supplica>
  # networking.wireless.enable = true; 

  networking.networkmanager.enable = true;

  # use nmcil/nmtui to manager network 
  programs.nm-applet.enable = true;

  networking.interfaces.wlp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.allProxy = "http://127.0.0.1:8889";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  #networking.firewall.enable = true;
  #networking.firewall.allowedTCPPorts = [ 22 80 ];
  #networking.firewall.allowedUDPPorts = [ ];

  networking.extraHosts =
    ''
      # GitHub520 Host Start
      140.82.112.26                 alive.github.com
      140.82.112.25                 live.github.com
      185.199.108.154               github.githubassets.com
      140.82.112.21                 central.github.com
      185.199.108.133               desktop.githubusercontent.com
      185.199.108.153               assets-cdn.github.com
      185.199.108.133               camo.githubusercontent.com
      185.199.108.133               github.map.fastly.net
      199.232.69.194                github.global.ssl.fastly.net
      140.82.114.4                  gist.github.com
      185.199.108.153               github.io
      140.82.114.4                  github.com
      192.0.66.2                    github.blog
      140.82.114.5                  api.github.com
      185.199.108.133               raw.githubusercontent.com
      185.199.108.133               user-images.githubusercontent.com
      185.199.108.133               favicons.githubusercontent.com
      185.199.108.133               avatars5.githubusercontent.com
      185.199.108.133               avatars4.githubusercontent.com
      185.199.108.133               avatars3.githubusercontent.com
      185.199.108.133               avatars2.githubusercontent.com
      185.199.108.133               avatars1.githubusercontent.com
      185.199.108.133               avatars0.githubusercontent.com
      185.199.108.133               avatars.githubusercontent.com
      140.82.112.10                 codeload.github.com
      54.231.136.65                 github-cloud.s3.amazonaws.com
      52.217.229.65                 github-com.s3.amazonaws.com
      52.217.96.28                  github-production-release-asset-2e65be.s3.amazonaws.com
      52.217.77.92                  github-production-user-asset-6210df.s3.amazonaws.com
      52.217.172.9                  github-production-repository-file-5c1aeb.s3.amazonaws.com
      185.199.108.153               githubstatus.com
      64.71.144.202                 github.community
      23.100.27.125                 github.dev
      140.82.113.21                 collector.github.com
      13.107.42.16                  pipelines.actions.githubusercontent.com
      185.199.108.133               media.githubusercontent.com
      185.199.108.133               cloud.githubusercontent.com
      185.199.108.133               objects.githubusercontent.com


      # Update time: 2022-02-25T16:05:53+08:00
      # Update url: https://raw.hellogithub.com/hosts
      # Star me: https://github.com/521xueweihan/GitHub520
      # GitHub520 Host End
    '';
}
