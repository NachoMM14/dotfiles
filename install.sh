export DEBIAN_FRONTEND=noninteractive

sudo apt update -y && sudo apt install -y \
    zsh zgen git curl wget \
    vim less icdiff fd-find \
    htop unzip zip bat ripgrep eza ccze

# pnpm + Node LTS
curl -fsSL https://get.pnpm.io/install.sh | sh -
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
pnpm env use --global lts

# Starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p ~/.config
starship preset nerd-font-symbols -o ~/.config/starship.toml

touch ~/.zshrc
grep -qF "source $HOME/.dotfiles/.zshrc" ~/.zshrc || echo "source $HOME/.dotfiles/.zshrc" >> ~/.zshrc

chsh -s $(which zsh)

exec zsh
