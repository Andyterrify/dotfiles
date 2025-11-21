#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/wallpapers"

# Pick a random image
WP=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.webp' \) | shuf -n 1)

# Set it
swww img "$WP" --transition-type any --transition-duration 0.8
