{ config, ... }:

{
  environment.shellAliases = {
    ls = "exa";
    l = "exa -l";
    ll = "exa -al";
    la = "exa -a";
    tree = "exa --tree";

    ":q" = "exit";
    c = "clear";
    r = "ranger";

    nix-zsh = "nix-shell --run zsh";
    remake = "sudo nixos-rebuild switch";

    sgaa = "sudo git add";
    sgc = "sudo git commit";
    sgp = "sudo git push";

  };
}
