#!/bin/bash

echo "> Instalação dos aplicativos que são usados diariamente"

echo "1. Atualização do sistema"
sudo apt-get update
echo "> Atualização do sistema concluída"

echo "2. Verificando se o snapd e o flatpak estão instalados. Caso não estejam, serão instalados"

if ! [ -x "$(command -v snap)" ]; then
    echo "> O snapd não está instalado. Instalando..."
    sudo apt install -y snapd
    echo "> Instalação do snapd concluída"
else
    echo "> O snapd já está instalado"
fi

if ! [ -x "$(command -v flatpak)" ]; then
    echo "> O flatpak não está instalado. Instalando..."
    sudo apt install -y flatpak
    
    read -p "> Deseja instalar o plugin do flatpak para ele aparecer na loja do Ubuntu? (y/ANY) " flatpak_plugin
    if [[ "$flatpak_plugin" == "y" ]]; then
        sudo apt install -y gnome-software-plugin-flatpak
    fi

    echo "> Instalação do flatpak concluída"
else
    echo "> O flatpak já está instalado"
fi

echo "3. Instalação do Discord"
sudo snap install discord
echo "> Instalação do Discord concluída"

echo "4. Instalação do Spotify"
sudo snap install spotify
echo "> Instalação do Spotify concluída"

read -p "5. Você quer instalar o Obsidian? (y/ANY) " obsidian_install

if [[ "$obsidian_install" == "y" ]]; then
    sudo snap install obsidian --classic
    echo "> Instalação do Obsidian concluída"
fi

echo "> Tudo foi instalado com sucesso!"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"