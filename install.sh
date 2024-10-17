#!/bin/bash

# Script for prepare GNU/Linux
# Update linux
sudo apt-get autoremove -y
sudo apt-get upgrade -y

# Essentials
sudo apt-get update -y && sudo apt-get install -y \
    bash zsh zgen sudo wget git g++ make nodejs gnupg ca-certificates lsb-release \
    vim libbrotli-dev cmake  \
    ccze jq less icdiff catimg zoxide fd-find \
    curl httpie \
    man htop duf ncdu \
    unzip zip \
    locales locales-all \
    bat exa \
    lolcat figlet

# Fix batcat -> bat
sudo ln -s $(which batcat) /usr/local/bin/bat

# Fix fdfind -> fd
sudo ln -s $(which fdfind) /usr/local/bin/fd

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo mv $HOME/.dotfiles/custom.zsh-theme $HOME/.oh-my-zsh/custom/themes
echo source $HOME/.dotfiles/.zshrc >> ~/.zshrc

PATH=$HOME/bin:/usr/local/bin:$PATH

# Node / NPM install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install --lts

# Change to ZSH
chsh -s $(which zsh)

zsh
