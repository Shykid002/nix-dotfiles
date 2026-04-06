{ ... }:


{



wayland.windowManager.hyprland.settings = {
  windowrule = [
    "float on, match:title ^(Pomodoro Timer)$"
    "size 300 250, match:title ^(Pomodoro Timer)$"
    "center on, match:title ^(Pomodoro Timer)$"
    "pin on, match:title ^(Pomodoro Timer)$"

    "float on, match:class ^(waypaper)$, match:title ^(wayland)$"
    "size 400 500, match:class ^(waypaper)$, match:title ^(waypaper)$"
    "center on, match:class ^(waypaper)$, match:title ^(waypaper)$"

    "float on, match:class ^(gnome-pomodoro)$, match:title ^(Pomodoro)$"
    "size 400 500, match:class ^(gnome-pomodoro)$, match:title ^(Pomodoro)$"
    "center on, match:class ^(gnome-pomodoro)$, match:title ^(Pomodoro)$"

  ];

   windowrule = [
    # New block syntax for 0.54.x
    ''
    {
      name = "Waypaper Float"
      match:class = "^(waypaper)$"
      float = on
      size = 659 702
      move = 15 51
    }
    ''
  ];
};



}
