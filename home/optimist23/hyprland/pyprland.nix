{ pkgs, ... }:

{
  # 1. Install pyprland and wezterm
  home.packages = [
    pkgs.pyprland

  ];

  # 2. Configure pyprland.toml (Updated for WezTerm)
  xdg.configFile."pypr/config.toml".text = ''
    [pyprland]
    plugins = [
      "scratchpads",
      "magnify",
    ]

    [scratchpads.term]
    command = "kitty --class scratchpad-term"
    class = "scratchpad-term"
    animation = "fromTop"
    size = "75% 60%"
    unfocus = "hide"
    lazy = true


    [scratchpads.yazi]
    # Replace 'kitty' with your terminal (e.g., alacritty, foot)
    # The -e flag (or equivalent) passes the command to the terminal
    command = "kitty --class yazi-dropterm yazi"
    class = "yazi-dropterm"
    size = "40% 60%"
    animation = "fromLeft"

    
    [magnify]
    factor = 2
  '';
}

