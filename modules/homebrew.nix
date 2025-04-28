# Homebrew configuration for macOS via nix-darwin

{ config, pkgs, username, ... }:

{
  # Enable Homebrew management
  homebrew = {
    enable = true;

    taps = [
      "nikitabobko/tap"
    ];

    brews = [
      "ansible"
      "helm"
      "mas"
      "node"
      "mise"
      "powerlevel10k"
    ];

    masApps = {
      "Garageband" = 682658836;
      "iMovie" = 408981434;
      "Keynote" = 409183694;
      "Meny Bar Controller for Sonos" = 1357379892;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Anybox" = 1593408455;
      "Photomator" = 1444636541;
      "Final Cut Pro" = 424389933;
    };

    casks = [
      "1password-cli"
      "1password"
      "aerospace"
      "anki"
      "apparency"
      "basecamp"
      "caffeine"
      "calibre"
      "chatgpt"
      "fujifilm-x-raw-studio"
      "github"
      "hey"
      "monitorcontrol"
      "pocket-casts"
      "raycast"
      "santa"
      "send-to-kindle"
      "signal"
      "sonos"
      "sony-ps-remote-play"
      "steam"
      "suspicious-package"
      "tailscale"
      "the-unarchiver"
      "transmission"
      "utm"
      "whatsapp"
      "zoom"
    ];

    # Auto cleanup and updates on activation
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;
    onActivation.autoUpdate = true;
  };

  # Homebrew-specific settings (for multiarch / rosetta)
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
    autoMigrate = true;
  };
}