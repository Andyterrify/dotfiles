#!/usr/bin/env bash

# search for directory to switch to
if [[ $# -eq 1 ]]; then
    selected=$( find $1 -maxdepth 2 -type d | fzf )
else
    selected=$( find ~/projects \
    ~/work \
    ~/Documents/obsidian \
    ~/ \
    /archive/Photography \
    /archive/Photography/raw \
    /home/ \
    -mindepth 1 -maxdepth 1 -type d -mount | fzf)
fi

# extract first part of path
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# starts tmux
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_pane -c $selected
    exit 0
fi

# creates a new session in the running tmux instance
if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"

