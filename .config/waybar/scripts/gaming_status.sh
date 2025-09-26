#!/run/current-system/sw/bin/bash



if [ -f /tmp/gaming_mode_enabled ]; then
    echo '{"text": "", "tooltip": "Gaming Mode: Enabled", "class": "enabled"}'
else
    echo '{"text": "", "tooltip": "Gaming Mode: Disabled", "class": "disabled"}'
fi
