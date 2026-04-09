{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    # Appearance and behavior
    settings = {
      font_family = "FiraCode Nerd Font";
      font_size = "12.0";
      background_opacity = "0.9";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      active_tab_font_style = "bold";
    };

    # Tab Control & Layout Keybindings
    keybindings = {
      # Managing Tabs
      "ctrl+t" = "new_tab";
      "ctrl+w" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+." = "move_tab_forward";
      "ctrl+shift+," = "move_tab_backward";
      "ctrl+shift+alt+t" = "set_tab_title";
      
      # Quick Switch to Tabs (1-9)
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";

      # Multi-Window (Panes) within a tab
      "ctrl+enter" = "new_window";
      "ctrl+[" = "previous_window";
      "ctrl+]" = "next_window";
    };

    # Fish Shell Integration
    shellIntegration.enableFishIntegration = true;
  };

  # Fish-specific aliases and configuration
  programs.fish = {
    enable = true;
    shellAliases = {
      kssh = "kitty +kitten ssh";
      icat = "kitty +kitten icat";
      # Open current directory in a new kitty tab
      nt = "kitty @ launch --type=tab --cwd=$PWD";
    };
  };
}

