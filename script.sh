#!/bin/bash

# Mantém a autenticação sudo ativa
echo "Mantendo a autenticação sudo ativa..."
sudo -v
echo "Autenticação sudo mantida com sucesso."

sudo apt install git curl zsh tmux btop
echo "Instalando DataGrip via Snap..."
sudo snap install datagrip --classic
echo "DataGrip instalado com sucesso."

echo "Instalando Postman via Snap..."
sudo snap install postman
echo "Postman instalado com sucesso."

echo "Instalando Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh instalado com sucesso."

echo "Clonando plugins do Zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
echo "Plugins do Zsh clonados com sucesso."

ZSHRC_FILE=~/.zshrc
PLUGINS_LINE="plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)"

echo "Configurando plugins no .zshrc..."
if grep -q "^plugins=(" "$ZSHRC_FILE"; then
  sed -i "s/^plugins=(.*)/$PLUGINS_LINE/" "$ZSHRC_FILE"
else
  echo "$PLUGINS_LINE" >>"$ZSHRC_FILE"
fi
echo "Configuração de plugins concluída."

echo "Iniciando tmux..."
tmux
echo "Copiando configuração do tmux..."
cp "./tmux.conf" ~/.tmux.conf
echo "Clonando tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Recarregando configuração do tmux..."
tmux source ~/.tmux.conf
exit

echo "Instalando Kitty terminal..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo "Kitty terminal instalado com sucesso."

echo "Configurando Kitty terminal..."
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' >~/.config/xdg-terminals.list
echo "Configuração do Kitty terminal concluída."

echo "Copiando configuração do Kitty..."
cp "./kitty.conf" ~/.config/kitty/kitty.conf
echo "Configuração do Kitty copiada com sucesso."

# Define a pasta das fontes (assumindo que o script está no mesmo nível da pasta "fonts")
FONT_DIR="./fonts"

# Cria a pasta de fontes do usuário, caso não exista
mkdir -p ~/.local/share/fonts

# Copia todas as fontes para a pasta do usuário
echo "Copiando todas as fontes para a pasta do usuário..."
cp -r "$FONT_DIR"/* ~/.local/share/fonts/
echo "Fontes copiadas com sucesso."

# Atualiza o cache de fontes
echo "Atualizando o cache de fontes..."
fc-cache -fv
echo "Cache de fontes atualizado com sucesso."

# Instala os pacotes necessários
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

echo "Baixando e instalando LazyGit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz
echo "LazyGit instalado com sucesso."

echo "Instalando fzf..."
sudo apt install fzf
echo "fzf instalado com sucesso."

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
