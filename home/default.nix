{ inputs, system, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    # useUserPackages = true;
    users.yly = { imports = [ ./yly ]; };
    users.huyunfan = { imports = [ ./huyunfan ]; };
    extraSpecialArgs = { inherit inputs system; };
  };
}
