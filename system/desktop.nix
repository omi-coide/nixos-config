{ pkgs, lib, ... }:

{
  qt5 = {
    #  enable = true;
    #  style = "adwaita";
    #  platformTheme = "gnome";
  };
  #programs.qt5ct.enable = true;
  services.notify-daemon.enable = true;

  services = {
    xserver = {
      enable = true;

      displayManager = {
        sddm.enable = true;
        defaultSession = "plma";
      };

      ### kde plasma
      desktopManager.plasma5.enable = true;

    };
  };

}
