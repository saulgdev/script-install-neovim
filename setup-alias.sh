#!/bin/bash

# Adiciona aliases ao arquivo .zshrc
ZSHRC="$HOME/.zshrc"

# Verifica se o arquivo .zshrc existe
if [ -f "$ZSHRC" ]; then
  echo "Adicionando aliases ao $ZSHRC"
else
  echo "Criando $ZSHRC e adicionando aliases"
  touch "$ZSHRC"
fi

# Adiciona os aliases ao .zshrc
{
  echo 'alias e="exit"'
  echo 'alias c="clear"'
  echo 'alias v="nvim"'
  echo 'alias p="pnpm"'
  echo 'alias ls="eza -al --icons"'
  echo 'alias ll="eza -l --icons"'
  echo 'alias t="tmux"'
  echo 'alias gg="lazygit"'
  echo 'alias ff="fastfetch"'
} >>"$ZSHRC"
