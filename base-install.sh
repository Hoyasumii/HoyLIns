#!/bin/bash

# git, criação das chaves SSH, docker, docker-compose, code, zsh, oh-my-zsh

echo "Instalação inicial do sistema"

echo "1. Atualização do sistema"
sudo apt-get update
echo "Atualização do sistema concluída"

echo "2. Instalação e configuração do git"
sudo apt install -y git
echo "Instalação do git concluída"

read -p "2.1. Escolha o nome de usuário do git:" git_user
read -p "2.2. Escolha o email do usuário do git:" git_email

git config --global user.name "$git_user"
git config --global user.email "$git_email"

echo "Configuração do git concluída"

read -p "3. Você quer instalar o vscode? (y/ANY) " vscode_install

if [[ "$vscode_install" == "y" ]]; then
    echo "3.1. Verificndo se o snapd está instalado"

    if ! [ -x "$(command -v snap)" ]; then
        echo "O snapd não está instalado. Instalando..."
        sudo apt install -y snapd
        echo "Instalação do snapd concluída"
    else
        echo "O snapd já está instalado"
    fi

    echo "3.2. Instalando o vscode"
    sudo snap install --classic code
    echo "Instalação do vscode concluída"
fi

read -p "4. Você quer instalar o docker em sua máquina? (y/ANY) " docker_install

if [[ "$docker_install" == "y" ]]; then
    echo "4.1. Preparando o ambiente para instalação do docker"
    
    echo "4.1.1 Atualização dos pacotes + instalação dos pré-requisitos"
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg

    echo "4.1.2 Adicionando a chave GPG oficial do Docker"
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo "4.1.3 Configurando o ambiente"
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo "4.2. Instalando o docker"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo "Instalação do docker concluída"
    read -n 1 -s -r -p "Dica: se quiser instalar também o Docker Desktop, acesse https://docs.docker.com/desktop/install/linux-install/\nPRESSIONE QUALQUER TECLA PARA CONTINUAR"
    echo "\n"
fi

# Perguntar se quer criar as chaves SSH

read -p "6. Você quer instalar o zsh e o oh-my-zsh para deixar o terminal mais bonito? (y/ANY)" zsh_install

if [ $zsh_install == "y" ]; then
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Instalação do zsh e oh-my-zsh concluída"
fi

