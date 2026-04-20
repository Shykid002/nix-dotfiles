{ config, ... }:

let

 # Variables from your config
  img = ./. + "./assets";

  # Colors
  background = "rgba(0, 0, 0, 0)";
  foreground = "rgba(255, 255, 255, 1.0)";
  foreground-alt = "rgba(255, 255, 255, 0.3)";
  fail = "rgba(221, 8, 8, 0.8)";



  # Fonts
  main-font = "Ndot55";
  alt-font = "LetteraMonoLL-Regular";


in


{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "/home/optimist23/.cache/current_wallpaper.png";
          blur_passes = 2; # 0 disables blurring
          blurv_size = 5;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];


            shape = [
        # TOP LINE
        {
          monitor = "";
          size = "1300, 2";
          color = foreground;
          rounding = -1;
          position = "0, 250";
          halign = "center";
          valign = "center";
        }
        # USERBOX TOP LINE
        {
          monitor = "";
          size = "140, 1";
          color = foreground;
          position = "150, 51";
          halign = "left";
          valign = "bottom";
        }
        # USERBOX BOT LINE
        {
          monitor = "";
          size = "140, 1";
          color = foreground;
          position = "150, 26";
          halign = "left";
          valign = "bottom";
        }
        # PILL
        {
          monitor = "";
          size = "60, 20";
          color = background;
          rounding = -1;
          border_color = foreground;
          border_size = 1;
          position = "-35, -22";
          halign = "right";
          valign = "top";
        }
        # XRAY BOX CENTER (and others)
        {
          monitor = "";
          size = "30, 30";
          color = background;
          xray = true;
          position = "0, -140";
          halign = "center";
          valign = "center";
        }
      ];

   

      # Current Time
    label = [
        # CLOCK-HOUR
        {
          monitor = "";
          text = "cmd[update:1000] date +\" %I\"";
          color = foreground;
          font_family = main-font;
          font_size = 80;
          position = "7, -22";
          halign = "left";
          valign = "top";
        }
        # CLOCK-MINUTE
        {
          monitor = "";
          text = "cmd[update:1000] date +\" %M\"";
          color = foreground;
          font_family = main-font;
          font_size = 80;
          position = "7, -123";
          halign = "left";
          valign = "top";
        }
        # DATE
        {
          monitor = "";
          text = "cmd[update:1000] date +\"%a %B %d\"";
          color = foreground;
          font_family = main-font;
          font_size = 50;
          rotate = 90;
          position = "-20, -125";
          halign = "right";
          valign = "top";
        }

        {
          # YEAR
          monitor = "";
          text = "cmd[update:1000] date +\"%Y\"";
          color = "foreground";
          font_size = 10;
          font_family = "alt-font";
          position = "-48, -28";
          halign = "right";
          valign = "top";
        }
        # NAME
        {
          monitor = "";
          text = "HUMAN-01";
          color = foreground;
          font_family = alt-font;
          font_size = 11;
          position = "-1630, 52";
          halign = "right";
          valign = "bottom";
        }


         {
          # TAG-LEFT
          text = "LIVE";
          color = "$foreground";
          font_size = 10;
          font_family = "alt-font";
          position = "200, 252";
          halign = "left";
          valign = "center";
        }
        {
          # TAG-CENTER
          text = "YOUR";
          color = "foreground";
          font_size = 10;
          font_family = "alt-font";
          position = "0, 252";
          halign = "center";
          valign = "center";
        }
        {
          # TAG-RIGHT
          text = "LIFE";
          color = "foreground";
          font_size = 10;
          font_family = "alt-font";
          position = "-200, 252";
          halign = "right";
          valign = "center";
        }

         {
          # TAG-BOT
          text = "HYPRSTELLAR";
          color = "foreground";
          font_size = 9;
          font_family = "alt-font";
          position = "-35, 25";
          halign = "right";
          valign = "bottom";
        }
        {
          # HIRAGANA
          text = "かいぜん";
          color = "foreground";
          font_size = 10;
          font_family = "alt-font";
          position = "0, 190";
          halign = "center";
          valign = "bottom";
        }
        {
          # QUOTES-TOP
          text = "You can have everything and feel nothing.";
          color = "foreground";
          font_size = 8;
          font_family = "Ndot55Caps";
          position = "0, 130";
          halign = "center";
          valign = "bottom";
        }
        {
          # QUOTES-BOT
          text = "What you resist, persists. What you accept, dissolves.    What you resist, persists. What you accept, dissolves.";
          color = "foreground";
          font_size = 12;
          font_family = "Ndot55Caps";
          position = "0, 115";
          halign = "center";
          valign = "bottom";
        }

          {
          # BATTERY
          text = "cmd[update:1000] ${./battery.sh} --hyprlock";
          color = "foreground";
          font_size = 12;
          font_family = "main-font";
          position = "-930, 110";
          halign = "right";
          valign = "bottom";
          zindex = 1;
        }
        {
          # KEYBOARD LAYOUT
          text = "cmd[update:1000] ${./lang_notify.sh} --hyprlock";
          color = "foreground";
          font_size = 12;
          font_family = "main-font";
          position = "-730, 90";
          halign = "right";
          valign = "bottom";
          zindex = 1;
          allow_click = true;
          # Note: click_action might require latest hyprlock versions
          # click_action = "exec ~/.config/hypr/hyprlock/lang_notify.sh --switch";
        }

      ];


      image = [
     {
          monitor = "";
          path = "${img}/arrow.png";
          size = 30;
          position = "150, 100";
          halign = "left";
          valign = "bottom";
        }
        {
          monitor = "";
          path = "${img}/logo.png";
          size = 50;
          position = "0, 40";
          halign = "center";
          valign = "bottom";
          zindex = -1;
        } 

        {
          path = "${img}/steinberg.jpg";
          size = 110;
          rounding = 6;
          border_size = 0;
          border_color = "foreground-alt";
          rotate = 0;
          reload_time = -1;
          position = "30, 25";
          halign = "left";
          valign = "bottom";
        }
      ];


      # --- INPUT FIELD ---
      input-field = [{
        monitor = "";
        size = "80, 25";
        rounding = 3;
        outline_thickness = 0;
        inner_color = background;
        outer_color = background;
        check_color = background;
        font_color = foreground;
        font_family = alt-font;
        placeholder_text = "PASSCODE";
        fail_text = "WRONG PASSCODE <b>($ATTEMPTS)</b>";
        dots_size = 0.35;
        dots_spacing = 0.3;
        dots_center = true;
        fade_on_empty = false;
        position = "-925, 21";
        halign = "right";
        valign = "bottom";
      }];
    };
  };

   # 2. Add Hypridle Service
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        # Avoid starting multiple hyprlock instances
        lock_cmd = "pidof hyprlock || hyprlock";
        # Lock before the system goes to sleep
        before_sleep_cmd = "loginctl lock-session";
        # Turn monitor back on after resuming from sleep
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          # Lock the screen after 5 minutes (300 seconds)
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          # Turn off screen after 10 minutes (600 seconds)
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}

