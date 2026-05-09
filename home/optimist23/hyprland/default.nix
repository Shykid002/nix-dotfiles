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
    ./window-rule.nix
    ./env.nix
    ./autostart.nix
    ./keybinds.nix
    ./pyprland.nix

  ];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
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
        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = true;
        gaps_in = 3;
        gaps_out = 5;
        border_size = 3;
         # Use two colors here (e.g., your primary and a secondary/accent)
        "col.active_border" = "$primary $surface $tertiary $surface $secondary 45deg";
        "col.inactive_border" = "$surface";
       
             };

      decoration = {
        active_opacity = 1.0;
        inactive_opacity = 0.9;
      	rounding = 1;
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

      dim_inactive = false;
      dim_strength = 0.1;
      dim_special = 0;

      };



    animations = {
          enabled = "yes";
          bezier = [
           "linear, 0, 0, 1, 1"
           "win, 0.05, 0.9, 0.1, 1.05"
           "winIn, 0.05, 0.7, 0.1, 1.1"
           "winOut, 0.05, 0.6, 0.1, 1"
           "menu_decel, 0.1, 1, 0, 1.02"
           "menu_accel, 0.38, 0.04, 1, 0.07"
           ];
          animation = [
            "windows,     1, 4, win, slide"
            "windowsIn,   1, 5, winIn, slide"
            "windowsOut,  1, 5, winOut, slide"
            "windowsMove, 1, 5, win, slide"
            "border, 1, 10, default"
            "borderangle, 1,10, linear"
            "fade, 1, 3, winIn"
            "layersIn, 1, 2, menu_decel,"
            "fadeLayersIn, 1, 2, menu_decel"
            "fadeLayersOut, 1, 4.5, menu_accel"
            "workspaces, 1, 7, menu_decel, slide"
            "specialWorkspace, 1, 4, winIn, slidevert"
          ];

};
    
      misc = {
        vfr = true;
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = true;
        swallow_regex = "^(wezterm)$";
      };
    };
  };
}

