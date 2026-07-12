set -e
export DEBIAN_FRONTEND=noninteractive

sudo apt update -y && sudo apt install -y \
    zsh zgen git curl wget \
    vim less icdiff fd-find \
    htop unzip zip bat ripgrep ccze fzf

# eza: not in Debian 12 repos, install from GitHub
curl -fLO https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz
sudo mv eza /usr/local/bin/
rm eza_x86_64-unknown-linux-gnu.tar.gz

# pnpm + Node LTS
curl -fsSL https://get.pnpm.io/install.sh | sh -
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME/bin:$PATH"
pnpm env use --global lts

# Starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p ~/.config
starship preset nerd-font-symbols --force -o ~/.config/starship.toml

# fzf shell integration
mkdir -p ~/.config/fzf
cp /usr/share/doc/fzf/examples/completion.zsh /usr/share/doc/fzf/examples/key-bindings.zsh ~/.config/fzf/

touch ~/.zshrc
grep -qF "source $HOME/.dotfiles/.zshrc" ~/.zshrc || echo "source $HOME/.dotfiles/.zshrc" >> ~/.zshrc

sudo chsh -s $(which zsh) $USER

exec zsh
