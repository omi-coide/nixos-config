{ inputs, system, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    # useUserPackages = true;
    users.yly = { imports = [ ./yly.nix ]; };
    extraSpecialArgs = { inherit inputs system; };
  };
}
