#!/bin/bash

grim -t png -l 3  -g "$(slurp)" "$HOME/Pictures/Screenshots/Screenshot-$(date --iso-8601=ns).png"
