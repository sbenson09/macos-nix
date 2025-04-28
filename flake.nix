{
  description = "Sean's modular macOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, ... }:
    let
      username = "sbenson"; # Define username once and reuse
    in {
      darwinConfigurations."${username}" = nix-darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          ./modules/configuration.nix
          ./modules/homebrew.nix
          ./modules/system-defaults.nix
          ./modules/users.nix
        ];
        specialArgs = {
          inherit username; # Pass username into modules
          inherit self;      # Pass flake self into modules
        };
      };
    };
}