{ ... }: {
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            #"waybar"
            "dunst"
            "vibepanel"
            "lxqt-policykit-agent"
	    "waypaper --restore"
            "swww-daemon"   
        ];
    };



}
