#!/usr/bin/env bash

# Function to get the raw value and strip decimals/quotes
GET_VAL() {
    dbus-send --print-reply --dest=org.gnome.Pomodoro /org/gnome/Pomodoro org.freedesktop.DBus.Properties.Get string:"org.gnome.Pomodoro" string:"$1" 2>/dev/null | grep -A1 "variant" | tail -n1 | awk '{print $NF}' | tr -d '"' | cut -d'.' -f1
}

ELAPSED=$(GET_VAL "Elapsed")
TOTAL=$(GET_VAL "StateDuration")
STATE=$(GET_VAL "State")
PAUSED=$(dbus-send --print-reply --dest=org.gnome.Pomodoro /org/gnome/Pomodoro org.freedesktop.DBus.Properties.Get string:"org.gnome.Pomodoro" string:"IsPaused" 2>/dev/null | grep "boolean" | awk '{print $3}')

# Exit if no app is running
if [ -z "$ELAPSED" ] || [ "$STATE" == "null" ] || [ -z "$TOTAL" ]; then
    echo "OFF"
    exit 0
fi

# Math: Remaining = Total - Elapsed
REMAINING=$((TOTAL - ELAPSED))

# Handle negative numbers (if elapsed > duration)
if [ "$REMAINING" -le 0 ]; then
    echo "Done!"
    exit 0
fi

# Convert to MM:SS
MIN=$((REMAINING / 60))
SEC=$((REMAINING % 60))

# Visuals
ICON="  "
[[ "$PAUSED" == "true" ]] && ICON="⏸"

if [ "$STATE" == "pomodoro" ]; then
    printf "%s %02d:%02d\n" "$ICON" "$MIN" "$SEC"
else
    printf "Break %02d:%02d\n" "$MIN" "$SEC"
fi

