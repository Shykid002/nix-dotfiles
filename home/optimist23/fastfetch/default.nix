{ pkgs, ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com";
      logo = {
        source = "${./tweety2.png}";
        type = "kitty";
        height = 10;
        padding = {
          top = 5;
        };
      };
      display = {
        separator = "  ";
      };
      modules = [
        "break" "break" "break"
        {
          type = "custom";
          # Use {#color_code} for more reliable color injection in Nix strings
          format = "{#90}    {#31}    {#32}    {#33}    {#34}    {#35}    {#36}    {#37}   ";
        }
        "break"
        {
          type = "title";
          keyWidth = 10;
        }
        "break"
        {
          type = "os";
          key = " "; # NixOS Icon
          keyColor = "34";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "34";
        }
        {
          type = "packages";
          format = "{} (nix)";
          key = " ";
          keyColor = "34";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "34";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "34";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "34";
        }
        {
          type = "terminalfont";
          key = " ";
          keyColor = "34";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
        "break"
      ];
    };
  };
}

