#!/run/current-system/sw/bin/bash

toggled=""
ktoggle() {
    CACHE_FILE="$HOME/.cache/laptop-keyboard-disabled"
    if [ -f "$CACHE_FILE" ]; then
        rm "$CACHE_FILE"
        if [[ $(sh -c "hyprctl keyword 'device[at-translated-set-2-keyboard]:enabled' 1") =~ $((a - z)) ]]; then
            toggled="󰌌"
        fi
    else
        touch "$CACHE_FILE"
        sh -c "hyprctl keyword 'device[at-translated-set-2-keyboard]:enabled' 0"
    fi
}

keyboard_toggle=$(ktoggle)
