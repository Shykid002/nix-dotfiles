{ ... }:


{



wayland.windowManager.hyprland.settings = {
  windowrule = [
     # Match first, then Effect
    "match:title ^(Pomodoro Timer)$, float on"
    "match:title ^(Pomodoro Timer)$, size 300 250"
    "match:title ^(Pomodoro Timer)$, center on"
    "match:title ^(Pomodoro Timer)$, pin on"

    "match:class ^(gnome-pomodoro)$ match:title ^(Pomodoro)$, float on"
    "match:class ^(gnome-pomodoro)$ match:title ^(Pomodoro)$, size 400 500"
    "match:class ^(gnome-pomodoro)$ match:title ^(Pomodoro)$, center on"

    "match:title ^(waypaper)$, float on"
    "match:title ^(waypaper)$, size 300 250"
    "match:title ^(waypaper)$, center on"
    "match:title ^(waypaper)$, pin on"
  ];
};



}
