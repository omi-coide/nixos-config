{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';
  };

  environment.shells = [ pkgs.bashInteractive pkgs.zsh pkgs.fish ];

  programs.thefuck.enable = true;
  # TODO  
  # https://discourse.nixos.org/t/installing-home-manager-from-nixos/8248
}
