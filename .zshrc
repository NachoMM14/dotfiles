# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY APPEND_HISTORY INC_APPEND_HISTORY
setopt AUTO_CD

export EDITOR="vim"

# Load zgen plugins (cached)
source /usr/share/zgen/zgen.zsh

if ! zgen saved; then
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zsh-history-substring-search
    zgen save
fi

# Completions
autoload -Uz compinit
compinit -u

# History substring search (type part of command, press up/down to filter)
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Word navigation with Ctrl+Left/Right
bindkey $'\e[1;5C' forward-word
bindkey $'\e[1;5D' backward-word

# fzf
if [[ -f "$HOME/.config/fzf/completion.zsh" ]]; then
    source "$HOME/.config/fzf/completion.zsh"
    source "$HOME/.config/fzf/key-bindings.zsh"
fi

source "$HOME/.dotfiles/.aliases"

eval "$(starship init zsh)"

export PATH="$HOME/bin:/usr/local/bin:$PATH"
