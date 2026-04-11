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
	        "$mainMod, F, fullscreen"
	        "$mainMod, Y, exec, waypaper"

            "$mainMod, T, togglefloating"
	        "$mainMod, M, exec, hyprctl keyword general:layout master"
          "$mainMod, A, exec, hyprctl keyword general:layout dwindle"


          "$mainMod, R, exec, pypr toggle term"
          "$mainMod, D, exec, pypr toggle yazi"
              

    	  "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"

          "$mainMod SHIFT, H, movewindow, l"
          "$mainMod SHIFT, L, movewindow, r"
          "$mainMod SHIFT, K, movewindow, u"
          "$mainMod SHIFT, J, movewindow, d"

          "$mainMod CTRL, l, resizeactive, 20 0"
          "$mainMod CTRL, h, resizeactive, -20 0"
          "$mainMod CTRL, k, resizeactive, 0 -20"
          "$mainMod CTRL, j, resizeactive, 0 20"

          "$mainMod, n, workspace, e+1"
          "$mainMod, p, workspace, e-1"
             


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
