# macOS Nix Configuration

This repository contains the configuration for Sean’s macOS system, built using nix-darwin and home-manager, fully modularized via Nix flakes.

It manages:
- System-wide settings (defaults, packages, services)
- Homebrew (via nix-darwin + nix-homebrew integration)
- User environment (shell setup, dotfiles, tools) using Home Manager
- Modular split across multiple focused .nix files


## 🛋️ Structure
```
.
├── flake.nix                # Top-level flake defining inputs, outputs, and module imports
├── flake.lock               # Locked dependencies (generated automatically)
├── modules/                 # Modular system configuration
│   ├── configuration.nix    # Basic system settings 
│   ├── homebrew.nix         # Homebrew and nix-homebrew setup
│   ├── system-defaults.nix  # macOS defaults 
│   └── users.nix            # User account and Home Manager environment
├── dotfiles/                # Linked dotfiles managed via Home Manager
│   ├── zshrc
│   ├── vimrc
│   ├── p10k.zsh
│   ├── gitconfig
│   ├── kitty.conf
│   └── vscode_settings.json
```


## 🚀 Usage

### 1. Install nix and nix-darwin

Follow the nix-darwin installation instructions:

```
sh <(curl -L https://nixos.org/nix/install)
nix run github:LnL7/nix-darwin
```

### 2. Clone this repository

```
git clone https://github.com/YOUR-USERNAME/sbenson-macos-flake.git
cd sbenson-macos-flake
```

### 3. Apply the system configuration

```
darwin-rebuild switch --flake .#sbenson
```

## 🔧 Updating dependencies

```
nix flake update
```
This updates flake.lock to the latest upstream revisions.


## 📃 Notes
- Apps installed via Homebrew’s mas-cli may require manual App Store login.
- macOS System extensions may require manual approval in macOS System Settings.
