{ inputs, system, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    # useUserPackages = true;
    users.yly = {imports = [ ./yly.nix ];};
    users.leylee = {imports = [ ./leylee.nix ];};
    users.billchenchina = {imports = [ ./billchenchina.nix ];};
    extraSpecialArgs = { inherit inputs system; };
  };
}
