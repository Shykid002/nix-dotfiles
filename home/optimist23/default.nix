{ config, pkgs, inputs, ... }:

  let

    vibepanel =  inputs.vibepanel.packages.${pkgs.system}.default;

  in


{
 

  imports = [
    ./kitty
    ./mpv 
    ./hyprlock
    ./fastfetch
    ./hyprland # This looks for ./hyprland/default.nix automatically
  ];


  
  # You can move user-specific packages here from configuration.nix
  home.packages = with pkgs; [
    # General apps
        #dunst        # A lightweight and customizable notification daemon
        eza          # A modern, feature-rich replacement for the 'ls' command
        fuzzel       # An application launcher and menu for Wayland (similar to rofi)
        hyprshade    # A tool to manage screen shaders/filters for Hyprland
        libnotify    # A library for sending desktop notifications
        pulsemixer   # A CLI-based audio mixer for PulseAudio and PipeWire
        qutebrowser  # A keyboard-focused web browser with a Vim-like interface
        vibepanel    # A lightweight, customizable status bar for Wayland
        vlc          # A versatile and powerful cross-platform media player
        zoxide       # A smarter 'cd' command that learns your habits
  ];

  # Enable Fish
  programs.fish = {
    enable = true;
    # Note: Aliases and zoxide init are now handled automatically by the modules below
  };

  # Modern 'ls' replacement
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
    git = true;
  };

  # Smarter 'cd' command
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # Install fzf for 'zi' (interactive jumping)
  programs.fzf.enable = true;

# Ensure there is only ONE closing brace at the very end of your file

  programs.oh-my-posh = {
     enable = true;
     enableFishIntegration = true;
     useTheme = "1_shell"; # Pick any theme you like
  };

   # Change "user" to your actual username
      home = {
          username = "optimist23";
          homeDirectory = "/home/optimist23";
          stateVersion = "25.05";
      };


  # Basic Home Manager settings
  programs.home-manager.enable = true;

}
