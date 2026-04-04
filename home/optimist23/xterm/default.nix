{ pkgs, ... }:

{
  # Ensure xterm is installed
  home.packages = [ pkgs.xterm ];

  # Configure xterm settings via Xresources
  xresources.properties = {
    "XTerm*faceName" = "Monospace";
    "XTerm*faceSize" = "16";
    "XTerm*renderFont: true";
    "XTerm*saveLines" = "4096";
    "XTerm*charClass" = "33:48,35:48,37:48,43:48,45-47:48,58:48,61:48,63-64:48,95:48,126:48";
    "XTerm*termName" = "xterm-256color";

    # Global Scaling for 1080p
    "Xft.dpi" = "120";           # 125% scaling (standard for 1080p clarity)
    "Xft.antialias" = "1";
    "Xft.hinting" = "1";
    "Xft.hintstyle" = "hintslight";
     "XTerm.vt100.translations" = "#override \\n\\
    Ctrl <Key> plus: larger-vt-font() \\n\\
    Ctrl <Key> minus: smaller-vt-font() \\n\\
    Ctrl <Key> 0: set-vt-font(d)";
  };
}

