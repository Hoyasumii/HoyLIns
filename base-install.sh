#!/bin/bash

# git, criação das chaves SSH, docker, docker-compose, code, zsh, oh-my-zsh

echo "Instalação inicial do sistema"

echo "1. Atualização do sistema"
sudo apt-get update
echo "> Atualização do sistema concluída"

echo "2. Verificando se o curl e o snapd estão instalados"

if ! [ -x "$(command -v curl)" ]; then
    echo "> O curl não está instalado. Instalando..."
    sudo apt install -y curl
    echo "> Instalação do curl concluída"
else
    echo "> O curl já está instalado"
fi

if ! [ -x "$(command -v snap)" ]; then
    echo "> O snapd não está instalado. Instalando..."
    sudo apt install -y snapd
    echo "> Instalação do snapd concluída"
else
    echo "> O snapd já está instalado"
fi

echo "3. Instalação e configuração do git"
sudo apt install -y git
echo "> Instalação do git concluída"

read -p "3.1. Escolha o nome de usuário do git: " git_user
read -p "3.2. Escolha o email do usuário do git: " git_email

git config --global user.name "$git_user"
git config --global user.email "$git_email"

echo "> Configuração do git concluída"

read -p "4. Você quer instalar o vscode? (y/ANY) " vscode_install

if [[ "$vscode_install" == "y" ]]; then
    sudo snap install --classic code
    echo "> Instalação do vscode concluída"
fi

read -p "5. Você quer instalar o docker em sua máquina? (y/ANY) " docker_install

if [[ "$docker_install" == "y" ]]; then
    echo "5.1. Preparando o ambiente para instalação do docker"
    
    echo "5.1.1 Atualização dos pacotes + instalação dos pré-requisitos"
    sudo apt-get update
    sudo apt-get install ca-certificates gnupg

    echo "5.1.2 Adicionando a chave GPG oficial do Docker"
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
    echo "> Instalação do docker concluída"
    read -n 1 -s -r -p "Dica: se quiser instalar também o Docker Desktop, acesse https://docs.docker.com/desktop/install/linux-install/\nPRESSIONE QUALQUER TECLA PARA CONTINUAR"
    echo "\n"
fi

read -p "5. Você quer criar uma chave SSH para configuração do GitHub, BitBucket e afins? (y/ANY) " ssh_keys

if [[ "$ssh_keys" == "y" ]]; then
    echo "5.1. Criando as chaves SSH"

    read -p "5.1.1. Você quer usar o email do git para criar as chaves SSH? (y/ANY) " ssh_has_git_email

    if [[ "$ssh_has_git_email" == "y" ]]; then
        git_email=$git_email
    else
        read -p "> Digite o email que você quer usar para criar as chaves SSH: " git_email
    fi

    read -p "5.1.2. Escolha o nome da chave SSH: " ssh_key_name

    ssh-keygen -t ed25519 -b 4096 -C "$git_email" -f ~/.ssh/$ssh_key_name
    # echo "5.2. Adicionando a chave SSH ao ssh-agent"
    # eval "$(ssh-agent -s)"
    # ssh-add ~/.ssh/id_rsa
    echo "> Chaves SSH criadas"
fi

# Perguntar se quer criar as chaves SSH

# read -p "6. Você quer instalar o zsh e o oh-my-zsh para deixar o terminal mais bonito? (y/ANY)" zsh_install

# if [ $zsh_install == "y" ]; then
#     sudo apt install -y zsh
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#     echo "Instalação do zsh e oh-my-zsh concluída"
# fi

