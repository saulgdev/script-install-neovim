#!/bin/bash

# Mantém a autenticação sudo ativa
echo "Mantendo a autenticação sudo ativa..."
sudo -v
echo "Autenticação sudo mantida com sucesso."

sudo apt install git curl

chmod +x ./install-jetbrains-fonts.sh
./install-jetbrains-fonts.sh
chmod +x ./install-homebrew.sh
./install-homebrew.sh
chmod +x ./install-zsh.sh
./install-zsh.sh
chmod +x ./setup-alias.sh
./setup-alias.sh
chmod +x ./install-kitty-terminal.sh
./install-kitty-terminal.sh
chmod +x ./install-neovim.sh
./install-neovim.sh
chmod +x ./install-node.sh
./install-node.sh
chmod +x ./install-lazyvim.sh
./install-lazyvim.sh
chmod +x ./install-tmux-plugins.sh
./install-tmux-plugins.sh
chmod +x ./install-apps.sh
./install-apps.sh
chmod +x ./install-docker.sh
./install-docker.sh
