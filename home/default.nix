{ inputs, system, ... }:
let
  ylyHomeProfile = ./yly.nix;
in
{
  home-manager = {
    useGlobalPkgs = true;
    # useUserPackages = true;
    users.yly = {
      imports = [
        ylyHomeProfile
      ];
    };
    extraSpecialArgs = { inherit inputs system; };
  };
}
