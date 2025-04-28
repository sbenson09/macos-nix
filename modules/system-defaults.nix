# macOS system defaults and preferences

{ config, pkgs, username, ... }:

{
  system.defaults = {
    dock = {
      autohide = true;

      # Set persistent dock apps
      persistent-apps = [
        "/System/Applications/Messages.app"
        "/Applications/Pocket Casts.app"
        "/Applications/HEY.app"
        "/System/Cryptexes/App/System/Applications/Safari.app"
        "${pkgs.vscode}/Applications/Visual Studio Code.app"
        "/Applications/ChatGPT.app"
      ];
    };

    NSGlobalDomain.KeyRepeat = 2; # Faster key repeat
    loginwindow.GuestEnabled = false; # Disable Guest user
    finder.FXPreferredViewStyle = "Nlsv"; # List view by default
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true; # Auto macOS updates
  };
}