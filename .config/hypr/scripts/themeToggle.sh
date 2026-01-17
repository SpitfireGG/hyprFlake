#!/run/current-system/sw/bin/bash

noctalia-shell ipc call darkMode toggle
sleep 0.5
qs -c noctalia-shell ipc call wallpaper random
