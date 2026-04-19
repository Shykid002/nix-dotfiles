{ ... }: {
    wayland.windowManager.hyprland.settings = {
        env = [
	    "HYPRCURSOR_THEME,bibata"
	    "XCURSOR_THEME,bibata"
        "XCURSOR_SIZE,24"
	    "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        "MANPAGER,sh -c 'col -bx | bat -l man -p'" # format manual pages using bat
        "EDITOR,nvim"
        "__GL_THREADED_OPTIMIZATIONS,0"
        # Wayland compatibility
        "QT_QPA_PLATFORM,wayland;xcb"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "SDL_VIDEODRIVER,wayland"
        #"NIXOS_OZONE_WL,1"
        #"QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        ];
    };



}
