# Load zgen plugins (cached)
source /usr/share/zgen/zgen.zsh

if ! zgen saved; then
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zsh-history-substring-search
    zgen save
fi

source "$HOME/.dotfiles/.aliases"

eval "$(starship init zsh)"

export PAGER="less"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
