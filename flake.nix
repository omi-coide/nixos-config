{
  description = "nixos-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/ac1f5b72a9e95873d1de0233fddcb56f99884b37";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-cn = {
      url = "github:nixos-cn/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    ylynur = {
      url = "github:omi-coide/my-nur-packages/50abd464293651dd0f04c6e2b305f43c118fc375";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
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
      ylynur = inputs.ylynur;
    };
}

