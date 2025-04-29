# User account settings and Home Manager environment configuration

{ config, pkgs, username, lib, self, role, ... }:

{
  # Define local user
  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.zsh; # Set zsh as the default shell
  };

  # Home Manager global settings
  home-manager.useGlobalPkgs = true; # Share nixpkgs across Home Manager
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup"; # Backup old Home Manager files

  # Home Manager per-user configuration
  home-manager.users.${username} = { pkgs, ... }: {
    home = {
      username = username;
      homeDirectory = "/Users/${username}";
      stateVersion = "24.05"; # Home Manager version
    };

    # Create Developer Folder
    home.file."Developer/.keep".text = "";

    # Create screenshot folder
    home.file."Documents/Screenshots/.keep".text = "";

    # Link dotfiles into the home directory
    home.file.".zshrc".source = ../dotfiles/zshrc;
    home.file.".vimrc".source = ../dotfiles/vimrc;
    home.file.".p10k.zsh".source = ../dotfiles/p10k.zsh;
    home.file.".gitconfig".source = ../dotfiles/gitconfig;
    home.file.".config/kitty/kitty.conf".source = ../dotfiles/kitty.conf;
    home.file."Library/Application Support/Code/User/settings.json".source = ../dotfiles/vscode_settings.json;

    # Programs enabled through Home Manager
    programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
        defaultCommand = "fd --type f"; # Default command for fuzzy finding
        defaultOptions = [ "height 40%" "--layout=reverse" "--border" ];
      };

      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "zsh-autosuggestions"
            "kubectl"
            "aws"
            "brew"
            "colored-man-pages"
            "command-not-found"
            "docker-compose"
            "gh"
            "helm"
            "kubectx"
            "macos"
            "kind"
            "pip"
            "python"
            "pyenv"
            "terraform"
            "vagrant"
            "vscode"
            "gcloud"
            "zsh-syntax-highlighting"
            "sudo"
            "you-should-use"
            "history-substring-search"
          ];
        };
      };
    };

    launchd.agents = lib.mkIf (role == "personal") {
      tailscale = {
        enable = true;
        config = {
          Label = "com.tailscale.ipn";
          ProgramArguments = [ "/Applications/Tailscale.app/Contents/MacOS/Tailscale" "up" ];
          RunAtLoad = true;
          KeepAlive = true;
        };
      };
    };  
  };
}