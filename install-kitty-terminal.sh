#!/bin/bash

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

THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/Jellybeans.conf
wget "$THEME" -P ~/.config/kitty/kitty-themes/themes

cd ~/.config/kitty
ln -s ./kitty-themes/themes/Jellybeans.conf ~/.config/kitty/theme.conf

echo "Copiando configuração do Kitty..."
cp "./kitty.conf" ~/.config/kitty/kitty.conf
echo "Configuração do Kitty copiada com sucesso."
