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

# Mcfly
curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sh -s -- --git cantino/mcfly --to ~
sudo mv $HOME/mcfly /usr/local/bin

# Node / NPM install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install --lts
npm install -g ttf2woff

# Docker install
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y && sudo apt-get install docker-ce docker-ce-cli containerd.io  docker-compose-plugin -y
sudo usermod -aG docker $USER
sudo service docker start

# Woff2
git clone https://github.com/google/woff2.git
cd woff2
mkdir out
cd out
cmake ..
make && sudo make install
sudo cp woff2_* /usr/local/bin/
cd ..
cd ..
rm -rf woff2

# Change to ZSH
chsh -s $(which zsh)

zsh
