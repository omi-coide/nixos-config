{ config, pkgs, ... }:

{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    inputMethod = {
      # enabled = "ibus"; 
      # ibus.engines = with pkgs.ibus-engines; [ rime uniemoji libpinyin ];

      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-configtool
        fcitx5-chinese-addons
      ];
    };
  };

}

