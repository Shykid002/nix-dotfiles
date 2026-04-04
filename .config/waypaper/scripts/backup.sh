#!/bin/bash

# Traverse all userChrome.css files in the directory and replace the color scheme
find "$1" -name "userChrome.css" -type f -print0 | xargs -0 sed -i 's/prefers-color-scheme: dark/prefers-color-scheme: light/g'

# Traverse all userContent.css files in the directory and replace the color scheme
find "$1" -name "userContent.css" -type f -print0 | xargs -0 sed -i 's/prefers-color-scheme: dark/prefers-color-scheme: light/g'

post_command = yad --title="Theme Selection" \
                   --text="🌈 Choose theme mode" \
                   --button="Light Theme:0" \
                   --button="Dark Theme:1" \
&& (matugen image "$wallpaper" -m "light" && gsettings set org.gnome.desktop.interface color-scheme prefer-light) \
|| (matugen image "$wallpaper" && gsettings set org.gnome.desktop.interface color-scheme prefer-dark)
