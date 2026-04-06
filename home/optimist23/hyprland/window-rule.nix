{ ... }:


{



wayland.windowManager.hyprland.settings = {
  windowrule = [
    "float on, match:title ^(Pomodoro Timer)$"
    "size 300 250, match:title ^(Pomodoro Timer)$"
    "center on, match:title ^(Pomodoro Timer)$"
    "pin on, match:title ^(Pomodoro Timer)$"

    "float on, match:class ^(gnome-pomodoro)$, match:title ^(Pomodoro)$"
    "size 400 500, match:class ^(gnome-pomodoro)$, match:title ^(Pomodoro)$"
    "center on, match:class ^(gnome-pomodoro)$, match:title ^(Pomodoro)$"

    "float, class:(waypaper)"
    "size 700 500, class:(waypaper)"
    "center, class:(waypaper)"
    "pin, class:(waypaper)" # Keeps it visible across workspaces while you pick a wallpaper
  ];
};



}
