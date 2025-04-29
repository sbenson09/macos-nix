# Homebrew configuration for macOS via nix-darwin

{ config, pkgs, lib, role, username, ... }:

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

    masApps = 
      {
        "Keynote" = 409183694;
        "Numbers" = 409203825;
        "Pages" = 409201541;
      }
      // lib.optionalAttrs (role == "personal") {
        "Garageband" = 682658836;
        "iMovie" = 408981434;
        "Photomator" = 1444636541;
        "Final Cut Pro" = 424389933;
        "Anybox" = 1593408455;
      };

    casks = [
      "1password-cli"
      "1password"
      "aerospace"
      "apparency"
      "calibre"
      "chatgpt"
      "github"
      "monitorcontrol"
      "pocket-casts"
      "raycast"
      "send-to-kindle"
      "suspicious-package"
      "the-unarchiver"
      "utm"
      "whatsapp"
    ] ++ lib.optionals (role == "personal") [
      "anki"
      "basecamp"
      "caffeine"
      "calibre"
      "fujifilm-x-raw-studio"
      "hey"
      "santa"
      "signal"
      "sonos"
      "sony-ps-remote-play"
      "steam"
      "tailscale"
      "transmission"
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