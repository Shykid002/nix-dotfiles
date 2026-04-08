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
            "$mainMod, M, exit,i"
	        "$mainMod, space, exec, fuzzel"
	        "$mainMod, F, fullscreen"
	        "$mainMod, Y, exec, waypaper"
            "$mainMod, T, togglefloating"


             "$mainMod, Escape, exec, pypr toggle ${terminal} && hyprctl dispatch bringactivetotop"
             "$mainMod, E, exec, pypr toggle yazi && hyprctl dispatch bringactivetotop"
             "$mainMod, T, exec, pypr toggle btop && hyprctl dispatch bringactivetotop"
             "$mainMod, A, exec, pypr toggle pulsemixer && hyprctl dispatch bringactivetotop"
             "$shiftMod, W, exec, pypr toggle waypaper && hyprctl dispatch bringactivetotop"



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
