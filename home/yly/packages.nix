# this file contains packages that don't hava programs.* options for configuration
{ pkgs, nur }:
let
  cli-utils = with pkgs; [
    # unix tools
    htop
    ugrep
    ripgrep
    fd
    libtree # ldd as a tree
    tldr
    duf # replace du and df
    ncdu # NCurses Disk Usage
    pstree
    cloc # Lines of Code
    # nix tools
    nix-index
    nix-update
    nil
    sqlite-interactive
    v2ray
    screen
    appimage-run
    nix-ld
    steam-run
    rlwrap
    git-crypt

  ];
  development-tools = with pkgs; [
    coq
    python3

  ];
  unfree-pro-softwares = with pkgs;[
    quartus-prime-lite
    wpsoffice
    vscode
    nur.mathematica
  ];
  graphical = with pkgs; [

    colorpicker
    briss # java program to crop pdf books
    firefox
    glxinfo
    imagemagick
    qbittorrent
    rclone-browser
    remmina
    tdesktop
    tigervnc
    vlc
    audacity
    wine
    winetricks
    usbutils
    novnc
    killall
    rclone
    freerdp
    xrdp
  ];
  games = with pkgs; [ yuzu ppsspp nur.vita3k ];
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic
      dvisvgm dvipng# for preview and export as html
      wrapfig amsmath ulem hyperref capt-of
            adobemapping algorithm2e amscls amsfonts arphic atbegshi atveryend 
      auxhook babel beamer bibtex bigfoot bigintcalc bitset 
      booktabs carlisle ccaption changepage cjk cjkpunct cm cns ctablestack ctex 
      datatool dehyph dvipdfmx dvips 
      ec enumitem environ epstopdf-pkg eso-pic etex etexcmds etoolbox euenc everyhook 
      everysel everyshi fancyhdr fancyvrb fandol filehook firstaid float fontaxes 
      fonts-tlwg fontspec footmisc fp framed garuda-c90 gbt7714 geometry 
      gettitlestring glossaries glossaries-extra glyphlist 
      graphics graphics-cfg graphics-def grfext grffile helvetic hycolor hypdoc 
      hyph-utf8 hyphen-base hyphen-german ifoddpage iftex inconsolata 
      infwarerr intcalc jknapltx kastrup knuth-lib kpathsea 
      kvdefinekeys kvoptions kvsetkeys l3backend l3kernel l3packages latex 
      latex-amsmath-dev latex-base-dev latex-bin 
      latex-firstaid-dev latex-fonts latex-tools-dev latexconfig latexmk 
       letltxmacro lipsum listings lm lm-math ltxcmds 
      lua-alt-getopt luahbtex  lualatex-math lualibs 
      luaotfload  luatex  luatexbase 
      luatexja makeindex  mdwtools metafont 
       metalogo mfirstuc mfware  modes 
      mptopdf  ms multirow natbib newpx newtx norasi-c90 
      ntheorem oberdiek pdfescape pdflscape pdfpages pdftex  
      pdftexcmds pgf placeins plain platex platex-tools  psnfss 
      ptex ptex-base ptex-fonts  realscripts refcount relsize 
      rerunfilecheck rsfs scheme-infraonly siunitx splitindex 
       stringenc subfigure substr svn-prov symbol tex 
      tex-gyre tex-ini-files  texlive-scripts 
       texlive  
      textcase tikzpagenodes times tipa tools tracklang translator trimspaces ttfutils 
       txfonts uhc  unicode-data unicode-math 
      uniquecounter uplatex  uptex uptex-base uptex-fonts 
       url varwidth wadalab xcjk2uni xcolor xecjk xetex 
       xetexconfig xfor xkeyval xltxtra xpinyin xstring xunicode 
      zapfding zhmetrics zhmetrics-uptex zhnumber;
  });
in
cli-utils ++ development-tools ++ games ++ unfree-pro-softwares ++ graphical ++ [tex]
