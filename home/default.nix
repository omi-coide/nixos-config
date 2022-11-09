{ inputs, system, ... }:
let
  homeProfile = ./home.nix;
in
{
  home-manager = {
    useGlobalPkgs = true;
    # useUserPackages = true;
    users.yly = {
      imports = [
        homeProfile
      ];
    };
    extraSpecialArgs = { inherit inputs system; };
  };
}
