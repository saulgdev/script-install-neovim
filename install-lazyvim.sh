#!/bin/bash

echo "Baixando e instalando LazyGit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz
echo "LazyGit instalado com sucesso."

echo "Baixando e instalando ripgrep..."
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm ripgrep_14.1.0-1_amd64.deb
echo "ripgrep instalado com sucesso."

echo "Instalando fd-find..."
sudo apt install fd-find
echo "fd-find instalado com sucesso."

echo "Clonando configuração do Neovim..."
git clone git@github.com:saulgdev/my-neovim.git ~/.config/nvim
echo "Configuração do Neovim clonada com sucesso."
