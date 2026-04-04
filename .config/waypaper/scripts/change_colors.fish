#!/usr/bin/env fish

# 1. NixOS Environment Fix
set -gx XDG_DATA_DIRS "$XDG_DATA_DIRS:/run/current-system/sw/share/gsettings-schemas"

# 2. Get wallpaper path
set wallpaper "$argv"
if test -z "$wallpaper"; or not test -f "$wallpaper"
    echo "Usage: fish change_colors.fish /path/to/image.jpg"
    exit 1
end

# Add this line to update the Hyprlock background file
cp "$wallpaper" /home/optimist23/.cache/current_wallpaper.png

# 3. Extract colors
set colors (magick "$wallpaper" -scale 50x50 -colors 6 -unique-colors txt:- | grep -oE '#[A-Fa-f0-9]{6}' | sort -u)
if test -z "$colors"
    set colors "#0bd790" "#043d3b" "#000e21" "#023442"
end

# 4. Theme Logic (Fish v4 compatible)
set brightness (magick "$wallpaper" -colorspace Gray -format "%[fx:mean]" info:)

# In Fish v4, perform the comparison outside the math call or use dconf directly
if test (math "$brightness > 0.7") -eq 1
    set mode "light"
    set theme "Light Theme"
    # Using dconf avoids the "No schemas installed" error on NixOS
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
else
    set mode "dark"
    set theme "Dark Theme"
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
end

# 5. Format colors for YAD
set yad_input
for col in $colors
    set -a yad_input "$col" "<span bgcolor='$col' color='$col'>      </span> $col"
end

# 6. Launch YAD
set selection (printf "%s\n" $yad_input | yad --list \
    --column="Hex":HIDE \
    --column="Pick a color from your wallpaper" \
    --title="Color Selection" \
    --width=350 --height=350 \
    --print-column=1 \
    --separator="" \
    --undecorated \
    --close-on-unfocus)

# 7. Apply & Reload
if test $status -eq 0 -a -n "$selection"
    matugen color hex "$selection" -m "$mode" -t scheme-fruit-salad
else
    matugen image "$wallpaper" -m "$mode" -t scheme-fruit-salad
end

# Reload Apps
pkill -USR1 kitty 2>/dev/null
pkill vibepanel 2>/dev/null; hyprctl dispatch exec env GSK_RENDERER=gl vibepanel & disown 2>/dev/null

notify-send "Theme Updated" "New colors applied!" --icon="$wallpaper"

