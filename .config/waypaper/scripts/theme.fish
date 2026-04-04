#!/usr/bin/fish

set WALLPAPER "$HOME/Pictures/Night monochrome.jpg"

yad --title="Theme Selection" --text="🌈 Choose theme mode" --button="Light Theme:0" --button="Dark Theme:1" --width=300 --center

if test $status -eq 0
    # LIGHT MODE
    matugen image "$WALLPAPER" -m light -t scheme-fruit
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    # Force GTK to reload by switching theme
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
    set theme "Light"
else
    # DARK MODE
    matugen image "$WALLPAPER" -m dark -t scheme-fruit
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
    set theme "Dark"
end

# RELOAD APPS
killall -USR1 kitty ^/dev/null # Refresh Kitty
pkill -USR1 cava ^/dev/null    # Refresh Cava
notify-send "Theme Switched" "Mode: $theme"
