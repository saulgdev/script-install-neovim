#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Updating .zshrc with Homebrew environment setup" >>/home/saul/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>/home/saul/.zshrc
echo "Evaluating Homebrew environment"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "Installing gcc with Homebrew"
brew install gcc
echo "Installing fzf with Homebrew"
brew install fzf

brew install starship

echo 'eval "$(starship init zsh)"' >>/home/saul/.zshrc
