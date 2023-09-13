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
      defaultFonts.sansSerif = [ "Source Han Sans SC" ];
      defaultFonts.serif = [ "Source Han Serif SC" ];
    };

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      hack-font
      source-han-sans
      source-code-pro
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };
}
