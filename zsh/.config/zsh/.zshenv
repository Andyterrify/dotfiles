umask 002

export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# export PATH="$PATH:$HOME/.local:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/share/fnm:/usr/local/cuda-12.2/bin"
export PATH="$PATH:$HOME/.local:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/share/fnm:/usr/local/cuda-12.3/bin"

export LD_LIBRARY_PATH="/usr/local/cuda/lib64:/usr/local/cuda-12.3/lib64"

export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file '/remote/*'" # faster fzf when ripgrep is installed

export GRIM_DEFAULT_DIR="$(/usr/bin/xdg-user-dir  PICTURES)/screenshots"

export TERM="xterm-256color"
