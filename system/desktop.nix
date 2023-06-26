{ pkgs, lib, ... }:

{
  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  services.notify-daemon.enable = true;


  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        enableXfwm = false;
      };
    };
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [
          haskellPackages.xmonad-contrib
          haskellPackages.xmonad-extras
          haskellPackages.xmonad
        ];
        config = builtins.readFile ./xmonad.hs;
      };
    };
    displayManager.defaultSession = "kodi";
  };
  services.picom.enable = true;
  services.xserver.desktopManager.kodi.enable = true;
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "yly";
  services.xserver.displayManager.gdm = {
    enable = true;
    autoSuspend = false;
    autoLogin.delay = 30;
  };

  # Define a user account
  users.extraUsers.kodi.isNormalUser = true;
  users.users."kodi".password = "";
  nixpkgs.config.kodi.enableAdvancedLauncher = true;

}
