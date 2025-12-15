#!/usr/bin/bash


name="Screenshot_$(date -Ins)"

d=$HOME/Pictures/Screenshots/$(date +%Y)/$(date +%m)

mkdir -p $d
n=$d/$name

echo "Saved to $n"

grim -g "$(slurp)" "$n"
wl-copy < "$n"
