
{ config, pkgs, username, ... }:

{
  system.defaults = {
    # Dock and Finder settings
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv"; # List view

    # Global settings
    NSGlobalDomain = {
      KeyRepeat = 2;
      AppleShowAllExtensions = true; 
    };

    # Login Window
    loginwindow.GuestEnabled = false;

    # Software Updates
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

    # Screenshots
    screencapture = {
      type = "png"; 
      location = "~/Documents/Screenshots"; 
    };

    # Desktop Services (disable .DS_Store creation on network volumes)
    
    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        "com.apple.desktopservices.DSDontWriteNetworkStores" = true;
        "com.apple.desktopservices.DSDontWriteUSBStores" = true;
      };
    };
    
    # Dock persistent apps
    dock.persistent-apps = [
      "/System/Applications/Messages.app"
      "/Applications/Pocket Casts.app"
      "/Applications/HEY.app"
      "/System/Cryptexes/App/System/Applications/Safari.app"
      "${pkgs.vscode}/Applications/Visual Studio Code.app"
      "/Applications/ChatGPT.app"
    ];
  };
}