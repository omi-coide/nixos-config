{ pkgs, lib, ... }:

{
  qt5 = {
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
    displayManager.defaultSession = "xfce+xmonad";
  };

}
