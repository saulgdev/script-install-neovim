#!/bin/bash

sudo apt install tmux

echo "Copiando configuração do tmux..."
cp "./tmux.conf" ~/.tmux.conf
echo "Clonando tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Abrindo tmux e executando comandos..."
tmux new-session -d -s my_session "tmux source ~/.tmux.conf; exit"
