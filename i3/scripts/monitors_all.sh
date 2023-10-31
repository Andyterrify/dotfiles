#!/bin/bash

xrandr \
 --output DP-0 --off \
 --output DP-1 --off \
 --output DP-0.1 --mode 2560x1440 --pos 1080x195 --rotate normal \
 --output DP-0.2 --mode 1920x1080 --pos 0x0 --rotate right --rate 143.86 \
 --output eDP-1-0 --mode 1920x1080 --pos 1080x1635 --rotate normal \
 --output HDMI-A-1-0 --off \

