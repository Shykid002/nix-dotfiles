{ pkgs, lib, ... }: # Added pkgs and lib

let
  mod = "SUPER";
  workspaces = builtins.concatLists (builtins.genList
    (x:
      let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10)); in [
        "${mod}, ${ws}, workspace, ${builtins.toString (x + 1)}"
        "${mod} SHIFT, ${ws}, movetoworkspace, ${builtins.toString (x + 1)}"
      ])
    10);
in
{
  imports = [
    ./env.nix
    ./autostart.nix
    ./keybinds.nix
    ./pyprland.nix

  ];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    nemo
    wezterm
    # Scratchpad Dependencies
    foot
    yazi
    btop
    waypaper
    swaybg
  ];

  services.cliphist.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      source = "~/.config/hypr/colors.conf";
      
      monitor = [ ", highrr, auto, 1" ];
      
      # Merge the generated workspace binds here
      bind = [ ] ++ workspaces; 

      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 3;
        "col.active_border" = "$primary";
        "col.inactive_border" = "$surface";

             };

      decoration = {
        active_opacity = 0.9;
        inactive_opacity = 0.9;
      	rounding = 15;
        blur = {
          enabled = false;
          size = 5;
          passes = 4;
          new_optimizations = true;
          brightness = 1.1;
          vibrancy = 0.3;
          # xray = true
        #   popups = true
        # input_methods =true
        special=true;
        ignore_opacity = true;
        };

        shadow = {
            enabled = true;
            range = 20;
            render_power = 3;
            color = "0xee1a1a1a";

    };

      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [ "windows, 1, 4, myBezier" "workspaces, 1, 4, default" ];
      };

      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = true;
        swallow_regex = "^(kitty|foot|wezterm)$";
      };
    };
  };

  programs.pyprland = {
    enable = true;
    settings = {
      pyprland = { plugins = [ "scratchpads" ]; };
      scratchpads = {
        
        term = {
          class = "scratchpad.term";
          command = "foot --title=scratchpad.float";
          margin = 200;
        };


        yazi = {
          class = "scratchpad.yazi";
          command = "foot --title=scratchpad.float -e yazi";
          margin = 200;
        };


        waypaper = {
          lazy = true;
          class = "waypaper";
          animation = "fromTop";
          command = "waypaper";
          margin = 200;
          size = "85% 70%";
        };


        btop = {
          class = "scratchpad.btop";
          lazy = true;
          animation = "fromTop";
          command = "st --title=scratchpad.float -e btop -g 30:20";
          margin = 200;
        };



        pulsemixer = {
          lazy = true;
          animation = "fromTop";
          command = "foot --title=scratchpad.float -e pulsemixer";
          margin = 200;
          size = "85% 70%";
        };


      };
    };
  };
}

