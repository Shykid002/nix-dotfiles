{ ... }: {
    wayland.windowManager.hyprland.settings = {
        env = [
	    "HYPRCURSOR_THEME,bibata"
	    "XCURSOR_THEME,bibata"
        "XCURSOR_SIZE,24"
	    "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        # Wayland compatibility
        "NIXOS_OZONE_WL,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        ];
    };



}
