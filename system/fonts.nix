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
      defaultFonts.monospace = [ "Hack" ];
      defaultFonts.sansSerif = [ "Source Han Sans" ];
      defaultFonts.serif = [ "Source Han Sans" ];
    };

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      hack-font
      source-han-sans
      source-code-pro
    ];
  };
}
