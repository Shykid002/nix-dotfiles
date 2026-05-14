{ ... }: 
let
    vars = import ../../../host/nixOser/variables.nix;
    inherit
      (vars)
      browser
      terminal
      barChosed
      ;
in

{
    wayland.windowManager.hyprland.settings = {
        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, Q, exec, ${terminal}"
          "$mainMod, C, killactive,"
          "CTRL, M, exit"
	      "$mainMod, space, exec, fuzzel"
	      "$mainMod, F, fullscreen,1"
          "$mainMod SHIFT, F, fullscreen,0"



	      "$mainMod, W, exec, waypaper"
          "$mainMod, T, togglefloating"
          "$mainMod, T, resizeactive, exact 800 600"
          "$mainMod, T, centerwindow"
	      "$mainMod, M, exec, hyprctl keyword general:layout master"
          "$mainMod, D, exec, hyprctl keyword general:layout dwindle"


          "$mainMod, R, exec, pypr toggle term"
          "$mainMod, S, exec, pypr toggle yazi"
          "$mainMod, P, exec, pypr toggle volume"
              

    	  "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"

          
    	  "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod SHIFT, H, movewindow, l"
          "$mainMod SHIFT, L, movewindow, r"
          "$mainMod SHIFT, K, movewindow, u"
          "$mainMod SHIFT, J, movewindow, d"

          "$mainMod CTRL, l, resizeactive, 20 0"
          "$mainMod CTRL, h, resizeactive, -20 0"
          "$mainMod CTRL, k, resizeactive, 0 -20"
          "$mainMod CTRL, j, resizeactive, 0 20"
            
        # Switch to Workspaces (SUPER + 1-0)
          "SUPER, 1, workspace, name:一"
          "SUPER, 2, workspace, name:二"
          "SUPER, 3, workspace, name:三"
          "SUPER, 4, workspace, name:四"
          "SUPER, 5, workspace, name:五"
          "SUPER, 6, workspace, name:六"
          "SUPER, 7, workspace, name:七"
          "SUPER, 8, workspace, name:八"
          "SUPER, 9, workspace, name:九"
          "SUPER, 0, workspace, name:十"

          # Move Active Window to Workspaces (SUPER + SHIFT + 1-0)
          "SUPER SHIFT, 1, movetoworkspace, name:一"
          "SUPER SHIFT, 2, movetoworkspace, name:二"
          "SUPER SHIFT, 3, movetoworkspace, name:三"
          "SUPER SHIFT, 4, movetoworkspace, name:四"
          "SUPER SHIFT, 5, movetoworkspace, name:五"
          "SUPER SHIFT, 6, movetoworkspace, name:六"
          "SUPER SHIFT, 7, movetoworkspace, name:七"
          "SUPER SHIFT, 8, movetoworkspace, name:八"
          "SUPER SHIFT, 9, movetoworkspace, name:九"
          "SUPER SHIFT, 0, movetoworkspace, name:十"


          "$mainMod, n, workspace, e+1"
          "$mainMod, b, workspace, e-1"
             
          
           # Screenshot region/window to clipboard + file
        "SHIFT ALT, S, exec, sh -c 'grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/$(date +%Y-%m-%d-%H%M%S).png | wl-copy -t image/png'"

      # Screenshot full screen to clipboard
        "$mainMod SHIFT, S, exec, sh -c 'grim - | wl-copy'"


	          ];


	     # Use 'binde' for repeating actions like volume/brightness
        binde = [
            ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ];


	   # Use 'bindl' for switches/mute (works even if lid is closed/locked)
        bindl = [
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ];
    };

}
