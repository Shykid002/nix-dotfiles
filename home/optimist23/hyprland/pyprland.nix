{ pkgs, ... }:

{
  # 1. Install pyprland and wezterm
  home.packages = [
    pkgs.pyprland
    pkgs.wezterm
  ];

  # 2. Configure pyprland.toml (Updated for WezTerm)
  xdg.configFile."pypr/config.toml".text = ''
    [pyprland]
    plugins = [
      "scratchpads",
      "magnify",
    ]

    [scratchpads.term]
    command = "foot --class scratchpad-term"
    class = "scratchpad-term"
    animation = "fromTop"
    size = "75% 60%"
    unfocus = "hide"
    lazy = true
    
    [magnify]
    factor = 2
  '';
}

