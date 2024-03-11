# .zshenv   - Should only contain user’s environment variables.
# .zprofile - Can be used to execute commands just after logging in.
# .zshrc    - Should be used for the shell configuration and for executing commands
# .zlogin   - Same purpose than .zprofile, but read just after .zshrc.
# .zlogout  - Can be used to execute commands when a shell exit.#

# --- [ ZINIT ] --- #
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit ice depth=1; zinit light romkatv/powerlevel10k
# zinit light zsh-users/zsh-completions
zinit light MichaelAquilina/zsh-you-should-use

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice as"completion"
zinit snippet OMZP::rust/_rustc
zinit snippet OMZP::git


# --- [ POWERLEVEL10K ] --- #
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# --- [ VIM KEYBINDS ] --- #
zmodload zsh/complist
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


# --- [ COMPINSTALL ] --- #
source $ZDOTDIR/.zcomp

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=2000
SAVEHIST=10000
export KEYTIMEOUT=1

eval "$(fnm env --use-on-cd)"

eval "$(atuin init zsh --disable-up-arrow)"
source $ZDOTDIR/.shell-alias
