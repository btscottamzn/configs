#!/bin/bash
set -euxo pipefail

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "export SHELL=\$(which fish)" >> ~/.zshrc

# Install homebrew
echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding homebrew to zsh path"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install brew packages
brew install nvim fish fzf tmux ripgrep

mkdir -p ~/.config
cp -r ./nvim ~/.config/nvim
cp ./tmux/.tmux.conf ~/

# Make fish default
which fish | sudo tee -a /etc/shells
sudo yum install util-linux-user -y
chsh -s $(which fish)
usermod -s $(which fish) $USER

# TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Instal NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Go
wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.3.linux-amd64.tar.gz
rm go1.20.3.linux-amd64.tar.gz

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.zshrc

fish setup.fish
