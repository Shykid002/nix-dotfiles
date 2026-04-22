#!/usr/bin/env bash

# Use /sys/class/power_supply/BAT* to catch BAT0 or BAT1 automatically
BAT=$(ls /sys/class/power_supply/ | grep BAT | head -n 1)
battery_percentage=$(cat /sys/class/power_supply/$BAT/capacity)
battery_status=$(cat /sys/class/power_supply/$BAT/status)

# Icons
battery_icons=("  " "  " "  " "  " "  " "  " "  " "  " "  " "  " "  ")
charging_icon="  "

# Get index (0-10)
icon_index=$((battery_percentage / 10))
battery_icon=${battery_icons[$icon_index]}

[ "$battery_status" = "Charging" ] && battery_icon="$charging_icon"

# Output for Hyprlock
echo "$battery_icon $battery_percentage%"

