{ inputs, system, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    # useUserPackages = true;
    users.yly = { imports = [ ./yly ]; };
    extraSpecialArgs = { inherit inputs system; };
  };
}
