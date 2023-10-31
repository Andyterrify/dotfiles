#!/bin/bash

xrandr \
 --output DP-0.1 --primary --mode 2560x1440 --pos 0x240 --rotate normal \
 --output DP-0.2 --mode 1920x1080 --pos 2560x0 --rotate right --rate 143.86 \
 --output DP-0 --off \
 --output DP-1 --off \
 --output eDP-1-0 --off \
 --output HDMI-A-1-0 --off \

sleep 1

nvidia-settings --assign CurrentMetaMode=" \
  DP-0.1: nvidia-auto-select +0+240 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, \
  DP-0.2: 1920x1080_144 +2560+0 {rotation=right, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"

$HOME/.config/i3/scripts/set_wallpaper.sh

