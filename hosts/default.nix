{ inputs, system, ... }:
with inputs;
let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;

  sharedModules = [
    ../nixconfig.nix
    ../users.nix
    { nixpkgs.overlays = [ nur.overlay ]; }
    { nixpkgs.config.permittedInsecurePackages = [ "electron-9.4.4" ]; }
    { nix.registry.nixpkgs.flake = inputs.nixpkgs; }
    ({ pkgs, config, ... }: {
      imports = [
        nixos-cn.nixosModules.nixos-cn-registries
        nixos-cn.nixosModules.nixos-cn
      ];
    })

  ] ++ (with inputs;[
    # agenix.nixosModule
    home-manager.nixosModules.home-manager
  ]) ++ (import ../modules);

in
{
  nixos = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs system; };
    modules = (import ./nixos) ++ sharedModules;
  };
}
