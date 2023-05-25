#!/bin/bash

echo "Instalação inicial do sistema\n"

echo "1. Atualização do sistema\n"
sudo apt-get update

echo "2. Instalação e configuração do git\n"
sudo apt install -y git

echo "2.1. Escolha o nome de usuário do git:"
read git_user

echo "2.2. Escolha o email do usuário do git:"
read git_email

git config --global user.name "$git_user"
git config --global user.email "$git_email"



echo "3. Instalação do zsh\n"
sudo apt install -y zsh

echo "3.1. Instalação do oh-my-zsh\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

