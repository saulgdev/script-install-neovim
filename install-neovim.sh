#!/bin/bash

echo "Instalando pacotes necessários para o NEOVIM"
sudo apt-get install -y ninja-build gettext cmake curl build-essential
echo "Pacotes instalados com sucesso."

echo "Clonando o repositório do Neovim..."
git clone https://github.com/neovim/neovim
echo "Repositório clonado com sucesso."

echo "Entrando no diretório do Neovim..."
cd neovim

echo "Compilando o Neovim..."
make CMAKE_BUILD_TYPE=RelWithDebInfo
echo "Compilação concluída com sucesso."

echo "Instalando o Neovim..."
sudo make install
echo "Neovim instalado com sucesso."

echo "Retornando ao diretório inicial..."
cd
rm -rf neovim
