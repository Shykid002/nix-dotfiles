{ ... }: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "HYPRCURSOR_THEME,bibata"
      "XCURSOR_THEME,bibata"
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
      
      "MANPAGER,sh -c 'col -bx | bat -l man -p'" # format manual pages using bat
      "EDITOR,nvim"
      
      # WAYLAND & ELECTRON COMPATIBILITY
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
      "SDL_VIDEODRIVER,wayland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      
      # QT SPECIFIC CONFIGURATIONS
      "QT_QPA_PLATFORM,wayland;xcb"            # Cleaned up duplicate; fallback to xcb if wayland fails
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_QPA_PLATFORMTHEME,qt5ct"             # Tells QT apps to use qt5ct for styling
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      
    ];
  };
}
