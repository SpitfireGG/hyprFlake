#!/run/current-system/sw/bin/bash

touch /tmp/gaming_mode_enabled
notify-send 'Gaming Mode Enabled,Disabling waybar and other unnecessary components' -i "󰊴"

if [[ "$(pidof waybar)" =~ ^-?[0-9]+$ ]]; then
    pkill waybar
fi
if [[ "$(pidof firefox)" =~ ^-?[0-9]+$ ]]; then
    pkill firefox
fi

if [[ "$(pidof alacritty)" =~ ^-?[0-9]+$ ]]; then
    pkill alacritty
fi

if [ -d "$HOME/.cache" ]; then
    find "$HOME/.cache" ! -name 'swww' -type d -exec rm -r {} +
fi

pcsx2-qt
