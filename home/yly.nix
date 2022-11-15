{ inputs, system, config, pkgs, ... }:
{
  services.trayer.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yly";
  home.homeDirectory = "/home/yly";

  home.packages =  (with pkgs; [
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
    # other apps
    # nodejs
    # nodePackages.npm
    # yarn
    # hugo
    v2ray
    screen
    (writeShellScriptBin "et" "${config.programs.emacs.package}/bin/emacs -nw $@")
    wayfire
    firefox
    glxinfo
    wayland-utils
    krfb
    tigervnc
    steam-run
    nix-ld
    vscode
    appimage-run
  ]);

  programs.git = {
    enable = true;
    # userName = "rewine";
    # userEmail = "lhongxu@outlook.com";
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
      http.proxy ="http://127.0.0.1:12333";
      protocol."https".allow = "always";
      url."https://github.com/".insteadOf = [ "gh:" "github:" ];
    };
  };
  programs.zsh.enable = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh = {
    oh-my-zsh = {
      enable=true;
      plugins=["git" "extract"  "sudo" "dirhistory"  "per-directory-history"];
      theme = "ys";
    };
    history = {
      size = 1000000;
    };
  };
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      coc.enable = true;
      plugins = with pkgs.vimPlugins; [
        fugitive
        vim-nix
        {
          plugin = vim-startify;
          config = "let g:startify_change_to_vcs_root = 0";
        }
      ];
      extraConfig = ''
        set whichwrap+=<,>,[,],h,l
      '';
    };
  };

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

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

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
