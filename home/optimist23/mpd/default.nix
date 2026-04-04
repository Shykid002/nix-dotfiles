{ config, pkgs, ... }:

let
  # Define a base folder for MPD data so you don't have to repeat it
  mpdDataDir = "${config.home.homeDirectory}/.config/mpd";
in
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    
    # These MUST be absolute paths (starting with /)
    playlistDirectory = "${mpdDataDir}/playlists";
    dbFile = "${mpdDataDir}/database";
    dataDir = mpdDataDir; 
    
    network.listenAddress = "127.0.0.1";

    extraConfig = ''
      auto_update           "yes"
      bind_to_address       "127.0.0.1"
      
      # Use absolute paths in extraConfig as well to avoid permission issues
      bind_to_address       "${mpdDataDir}/socket"
      log_file              "${mpdDataDir}/log"
      pid_file              "${mpdDataDir}/pid"
      sticker_file          "${mpdDataDir}/sticker.sql"
      state_file            "${mpdDataDir}/state"

      audio_output {
        type            "pipewire"
        name            "PipeWire Sound Server"
        mixer_type      "hardware"
      }

      audio_output {
        type            "fifo"
        name            "my_fifo"
        path            "/tmp/mpd.fifo"
        format          "44100:16:2"
      }
    '';
  };
}

