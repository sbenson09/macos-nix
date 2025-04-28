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
      "awscli"
      "bat"
      "dive"
      "gh"
      "go"
      "helm"
      "htop"
      "jq"
      "kind"
      "kubectx"
      "kubernetes-cli"
      "mas"
      "nmap"
      "node"
      "opentofu"
      "powerlevel10k"
      "pyenv"
      "trivy"
      "zsh-autosuggestions"
      "zsh-syntax-highlighting"
      "mise"
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
      "aerospace"
      "whatsapp"
      "chatgpt"
      "anki"
      "basecamp"
      "caffeine"
      "calibre"
      "discord"
      "grandperspective"
      "hey"
      "pocket-casts"
      "send-to-kindle"
      "signal"
      "sonos"
      "sony-ps-remote-play"
      "steam"
      "santa"
      "tailscale"
      "transmission"
      "utm"
      "firefox"
      "fujifilm-x-raw-studio"
      "1password"
      "1password-cli"
      "font-meslo-lg-nerd-font"
      "github"
      "google-cloud-sdk"
      "raycast"
      "slack"
      "the-unarchiver"
      "wireshark"
      "zoom"
      "spotify"
      "monitorcontrol"
      "suspicious-package"
      "apparency"
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