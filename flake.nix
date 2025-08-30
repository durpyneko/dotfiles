{
  description = "NixOS configurations and dotfiles";

  inputs = {
    # NixOS
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    spicetify.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      spicetify,
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      overlays = import ./nixos/overlay.nix { inherit inputs outputs; };

      nixosConfigurations = {
        nyanix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/common.nix

            # * Applications
            ./nixos/apps/spicetify.nix

            # * Extentions / Modules
            # ./nixos/module/wallpaper-engine-kde-plugin.nix

            # * Host / Self
            ./nixos/hosts/nyanix/cfg.nix # ? Configurations
            ./nixos/hosts/nyanix/env.nix # ? Env Variables
            ./nixos/hosts/nyanix/pkgs.nix # ? Packages
            ./nixos/hosts/nyanix/usrs.nix # ? Users
            ./nixos/hosts/nyanix/svcs.nix # ? Services
            ./nixos/hosts/nyanix/ntwrk.nix # ? Network stuff
            ./nixos/hosts/nyanix/progs.nix # ? Programs
            ./nixos/hosts/nyanix/nyanix.nix # ? Core
            ./nixos/hosts/nyanix/nyanix-hw.nix # ? Hardware

            # { nixos.pkgs.wallpaper-engine-kde-plugin.enable = true; }

          ];
        };
      };
    };
}
