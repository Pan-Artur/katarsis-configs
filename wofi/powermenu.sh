#!/bin/bash

entries="󰌾 Lock\n󰗼 Logout\n󰜉 Reboot\n󰐥 Shutdown"

selected=$(echo -e "$entries" | wofi --dmenu \
    --cache-file /dev/null \
    --hide-search \
    --width 280 \
    --lines 4 \
    --fixed-dims \
    --pre-select-none \
    --style ~/.config/wofi/powermenu.css \
    --location 0)

case $selected in
  *Lock) hyprlock ;;
  *Logout) hyprctl dispatch exit 0 ;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl poweroff ;;
esac
