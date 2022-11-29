{ pkgs, lib, ... }:

{
  qt5 = {
    enable = true;
    #  style = "adwaita";
    platformTheme = "qt5ct";
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };
  programs.qt5ct.enable = true;
  services.notify-daemon.enable = true;

  services = {
    xserver = {
      enable = true;

      displayManager = {
        sddm.enable = true;
        defaultSession = "plasma";
      };

    };
  };

}
