# Basic system-wide Nix configuration
{ config, pkgs, username, self, ... }:

{
  # Platform (Mac ARM)
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable flakes and nix-command features
  nix.settings.experimental-features = "nix-command flakes";

  # Allow unfree packages (e.g., Spotify, Zoom)
  nixpkgs.config.allowUnfree = true;

  # Track the flake revision (for system info)
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Versioning for system state, important for Darwin upgrades
  system.stateVersion = 6;

  # System packages to be installed globally
  environment.systemPackages = with pkgs; [
    vim
    tmux
    alacritty
    nixfmt-rfc-style
    oh-my-zsh
    vscode
    kitty
  ];
}