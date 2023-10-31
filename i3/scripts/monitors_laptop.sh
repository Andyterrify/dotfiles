
#!/bin/bash

xrandr \
 --output DP-0 --off \
 --output DP-1 --off \
 --output DP-0.1 --off \
 --output DP-0.2 --off \
 --output eDP-1-0 --mode 1920x1080 --pos 1080x1635 --rotate normal --rate 144.00 \
 --output HDMI-A-1-0 --off \

$HOME/.config/i3/scripts/set_wallpaper.sh
