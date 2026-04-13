#!/usr/bin/env fish
#
#


# 1. Get wallpaper path
set wallpaper "$argv"

# 2. Extract colors 
set colors (magick "$wallpaper" -sample 50x50 -colors 6 -unique-colors txt:- | grep -oE '#[A-Fa-f0-9]{6}' | sort -u)

# 3. Fallback
if test -z "$colors"
    set colors "#0bd790" "#043d3b" "#000e21" "#023442"
end

# 4. Format colors for YAD
set yad_input
for col in $colors
    set -a yad_input "$col"
    set -a yad_input "<span bgcolor='$col' color='$col'>      </span> $col"
end

# 5. Step One: Pick Color
set selection (printf "%s\n" $yad_input | yad --list \
    --column="Hex":HIDE \
    --column="Pick a color" \
    --width=350 --height=350 \
    --print-column=1 --separator="" --undecorated --close-on-unfocus)

if test $status -eq 0 -a -n "$selection"
    
    # 6. Step Two: Pick Mode
    yad --width=300 --text="Select theme style:" \
        --button="Dark Mode:10" --button="Light Mode:11" \
        --undecorated --close-on-unfocus
    set mode_status $status

    if test $mode_status -eq 10
        set final_mode "dark"
        set gtk_theme "adw-gtk3-dark" # Correct name for Dark
        set color_scheme "prefer-dark"
    else if test $mode_status -eq 11
        set final_mode "light"
        set gtk_theme "adw-gtk3"      # Correct name for Light (No -light suffix)
        set color_scheme "prefer-light"
    else
        exit
    end

    notify-send "主题已切换" "颜色: $selection | 模式: $final_mode" --icon="$HOME/.config/waypaper/scripts/icon.svg"


    # 7. Apply Everything
    
    # Apply GTK Preferences
    gsettings set org.gnome.desktop.interface color-scheme "$color_scheme"
    
    # Force GTK to reload CSS by toggling to a dummy theme and back
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    
    # Run matugen (This writes the ~/.config/gtk-3.0/gtk.css files)
    matugen color hex "$selection" -m "$final_mode" 
    
    # Set the actual theme
    gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"

    # Reload UI Components
    pkill -USR1 kitty
    pkill vibepanel; hyprctl dispatch exec env GSK_RENDERER=gl vibepanel

    

end

