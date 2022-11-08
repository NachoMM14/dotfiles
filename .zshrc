ZSH_THEME="custom"
plugins=(git colored-man-pages sudo)

# Reload theme
source $ZSH/oh-my-zsh.sh

# Load plugins
source /usr/share/zgen/zgen.zsh
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions
zgen load zsh-users/zsh-completions
zgen load zsh-users/zsh-history-substring-search

source ~/.dotfiles/.aliases

export PAGER="less"

# zoxide
eval "$(zoxide init zsh)"
rm -f ~/.zcompdump*; compinit

# mcfly
eval "$(mcfly init zsh)"

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
