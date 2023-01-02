{
  description = "nixos-config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    rew = {
      url = "github:wineee/rew-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ylynur = {
      url = "github:omi-coide/my-nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = github:nix-community/home-manager/master;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grub2-themes = {
      url = github:vinceliuice/grub2-themes;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    #taffybar = {
    #  url = "github:taffybar/taffybar";
    #  inputs.flake-utils.follows = "flake-utils";
    #};
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit inputs system;
        }
      );
      apps.${system}.update-home = {
        type = "app";
        program = (nixpkgs.legacyPackages.${system}.writeScript "update-home" ''
          set -eu pipefail
          old_profile=$(nix profile list | grep home-manager-path | head -n1 | awk '{print $4}')
          echo $old_profile
          nix profile remove $old_profile
          ${self.homeConfigurations.rewine.activationPackage}/activate || (echo "restoring old profile"; ${nixpkgs.legacyPackages.${system}.nix}/bin/nix profile install $old_profile)
        '').outPath;
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}

