set -U fish_greeting "🐟 blub blub"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source "$HOME/.cargo/env.fish"

# set preferred environment
set -Ux EDITOR nvim
set -Ux VISUAL nvim
