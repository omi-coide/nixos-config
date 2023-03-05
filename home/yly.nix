{ inputs, system, config, pkgs, ... }:
let
  nurpkgs = (with inputs.ylynur.packages.${system}; [ test-app ]);
  tex =  [(pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
      dvisvgm dvipng# for preview and export as html
      wrapfig amsmath ulem hyperref capt-of
            adobemapping algorithm2e amscls amsfonts arphic atbegshi atveryend 
      auxhook babel beamer bibtex bigfoot bigintcalc bitset 
      booktabs carlisle ccaption caption changepage cjk cjkpunct cm cns ctablestack ctex 
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
      textcase tikzpagenodes times tipa tools tracklang translator trimspaces ttfutils 
       txfonts uhc  unicode-data unicode-math 
      uniquecounter uplatex  uptex uptex-base uptex-fonts 
       url varwidth wadalab xcjk2uni xcolor xecjk xetex 
       xetexconfig xfor xkeyval xltxtra xpinyin xstring xunicode 
      zapfding zhmetrics zhmetrics-uptex zhnumber;
    })
    pkgs.xdg-utils
    pkgs.ghostscript
  ];
  utils = (with pkgs; [
    # unix tools
    htop
    ugrep
    ripgrep
    fd
    libtree # ldd as a tree
    tldr
    duf
    ncdu
    pstree
    cloc
    colorpicker
    # nix tools
    sqlite-interactive
    nix-index
    nix-update
    nil
    v2ray
    screen
    nix-ld
    vscode
    appimage-run
    gnumake

    ### begin auto insert package ###
    python3
    usbutils
    novnc
    killall
    rclone
    rlwrap

  ]);
in
{
  services.trayer.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yly";
  home.homeDirectory = "/home/yly";

  home.packages = utils ++ nurpkgs ++ tex;

  programs.git = {
    enable = true;
    userName = "omi-coide";
    userEmail = "74772084+omi-coide@users.noreply.github.com";
    delta.enable = true;
    lfs.enable = false;
    aliases = {
      co = "checkout";
      ci = "commit";
      cia = "commit --amend";
      s = "status";
      st = "status";
      b = "branch";
      p = "pull --rebase";
      pu = "push";
      d = "diff";
    };
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      core.compression = 0;
      http.postBuffer = 1048576000;
      http.proxy = "http://127.0.0.1:12333";
      protocol."https".allow = "always";
      url."https://github.com/".insteadOf = [ "gh:" "github:" ];
    };
  };
  programs.zsh.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "extract" "sudo" "dirhistory" "per-directory-history" ];
      theme = "ys";
      extraConfig = ''
        alias s='screen'
        alias open='xdg-open'
        hash -d AS="$HOME/Documents/assignment"
        hash -d PA="$HOME/Documents/HIT/Project/"
        hash -d IBM="$HOME/Documents/IBM"
        hash -d HIT="$HOME/grad/reports/"

      '';
    };
    history = {
      size = 1000000;
    };
  };
  programs.neovim = import ./neovim.nix { inherit pkgs; };

  programs.bat.enable = true;

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacsNativeComp;
  };
  home.sessionPath = [ "$HOME/.emacs.d/bin" ];

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    g = "git";
    "..." = "cd ../..";
  };

  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
