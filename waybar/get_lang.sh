#!/bin/bash
# Get active keyboard layout (EN/UA) for Waybar

layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | cut -c1-2 | tr '[:lower:]' '[:upper:]')

if [ -z "$layout" ]; then
    echo "EN"
else
    echo "$layout"
fi
