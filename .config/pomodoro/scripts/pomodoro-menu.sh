#!/usr/bin/env bash

# We removed --width and --height to enable auto-sizing
CHOICE=$(yad --list --title="Pomodoro Timer" \
    --column="Action" --column="Command" --hide-column=2 \
    --text="Select a Pomodoro action:" \
    --window-icon="appointment-soon" \
    --button="Close:1" \
    --close-on-unfocus \
    "▶ Start Pomodoro" "gnome-pomodoro --start" \
    "⏸ Pause Timer" "gnome-pomodoro --pause" \
    "⏹ Stop Timer" "gnome-pomodoro --stop" \
    "🔄 Reset Timer" "gnome-pomodoro --reset" \
    "🚀 Launch Pomodoro GUI" "gnome-pomodoro" \
    --print-column=2 --no-headers)

# Execute the selected command
if [ -n "$CHOICE" ]; then
    CMD=$(echo "$CHOICE" | sed 's/|//')
    eval "$CMD"
fi

