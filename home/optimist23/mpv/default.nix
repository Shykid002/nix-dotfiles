{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    
    # REQUIRED: This script makes Vibe Panel and playerctl work with mpv
    scripts = [ 
      pkgs.mpvScripts.mpris
      pkgs.mpvScripts.modernx  # This is the "ModernUX" you are looking for
      pkgs.mpvScripts.thumbfast # Recommended for seekbar thumbnails
    ];

    config = {
      # --- Interface ---
      osc = "no";
      border = "no";
      cursor-autohide = 1000;
      idle = "yes";

      # --- Video & Quality ---
      profile = "gpu-hq";
      hwdec = "auto-copy";
      vo = "gpu-next";
      scale = "spline36";
      dscale = "mitchell";
      cscale = "spline36";

      # --- Audio ---
      volume = 70;
      volume-max = 130;

      # --- Subtitles ---
      sub-auto = "fuzzy";
      sub-font = "sans-serif";
      sub-font-size = 40;

      # --- Behavior ---
      save-position-on-quit = "yes";
      loop-file = "inf";
      loop-playlist = "inf";

      # --- Screenshots ---
      screenshot-format = "png";
      screenshot-high-bit-depth = "yes";
      screenshot-directory = "~/Desktop";

      # --- Networking (YouTube-dl) ---
      ytdl-format = "bestvideo+bestaudio/best";
    };
  };
}

