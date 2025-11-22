#!/usr/bin/env bash

cmd_socket="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket.sock"
events_socket="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:"$events_socket" | while read -r line; do
    if [[ "$line" =~ ^windowtitlev2 ]]; then
		data=$(echo "$line" | cut -d'>' -f3-)
		addr=$(echo $data | cut -d',' -f1)
		title=$(echo $data | cut -d',' -f2-)
		echo $data $addr $title
		if [[ "$title" =~ ^Extension.*Bitwarden.* ]]; then
			echo toggling floating window $addr
			hyprctl --batch "dispatch setfloating address:0x$addr; dispatch resizewindowpixel exact 15% 35%,address:0x$addr; dispatch centerwindow address:0x$addr"
		fi
		echo ""
    fi
done
