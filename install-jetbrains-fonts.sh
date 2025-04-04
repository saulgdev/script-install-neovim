#!/bin/bash

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
