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
      gnome.enable = true;
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
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "gnome";
  };
  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #       xdg-desktop-portal-gtk
  #     ];
  #     # gtkUsePortal = true;
  #   };
  # };
  services.picom.enable = false;
  services.picom.vSync = true;
}
