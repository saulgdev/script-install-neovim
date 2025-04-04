#!/bin/bash

sudo apt install zsh

echo "Instalando Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
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

echo "Definindo Zsh como shell padrão..."
chsh -s $(which zsh)
echo "Zsh foi definido como shell padrão com sucesso."

echo "Removendo comentários desnecessários do .zshrc..."
sed -i '/^#/d' ~/.zshrc
echo "Comentários removidos com sucesso."
