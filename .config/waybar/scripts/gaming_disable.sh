#!/run/current-system/sw/bin/bash

rm -f /tmp/gaming_mode_enabled
notify-send 'Gaming Mode Disabled' -i "󰊵"

if ! pgrep waybar >/dev/null; then
    waybar &
fi
