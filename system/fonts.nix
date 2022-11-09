{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        autohint = false;
        # hintstyle = "hintslight(10px,12px)";
      };
      defaultFonts.emoji = [ "Noto Color Emoji" ];
      defaultFonts.monospace = [ "Hack" ];
      defaultFonts.sansSerif = [ "DejaVu Sans" ];
      defaultFonts.serif = [ "DejaVu Serif" ];
    };

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ] ;
  };
}
