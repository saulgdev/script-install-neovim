#!/bin/bash

echo "Instalando DataGrip via Snap..."
sudo snap install datagrip --classic
echo "DataGrip instalado com sucesso."

echo "Instalando Postman via Snap..."
sudo snap install postman
echo "Postman instalado com sucesso."

echo "Instalando o navegador Brave usando o script oficial de instalação..."
curl -fsS https://dl.brave.com/install.sh | sh
echo "Navegador Brave instalado com sucesso."

echo "Instalando btop via apt..."
sudo apt install btop
echo "btop instalado com sucesso."
