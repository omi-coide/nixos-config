{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  #networking.hostId = "71452b6e"; # for zfs pool

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enabling Bluetooth support
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # set console font
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gnome.gnome-keyring.enable = true;
  
  system.stateVersion = "22.11";
}
