#!/bin/bash

echo "- Verificando se o flatpak está instalado e o instalando caso não esteja"

if ! [ -x "$(command -v flatpak)" ]; then
    echo "- O flatpak não está instalado. Instalando..."
    sudo apt install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
    read -n 1 -p "- Deseja instalar o plugin do flatpak para ele aparecer na Gnome Software? (y/ANY) " flatpak_plugin
    if [[ "$flatpak_plugin" == "y" ]]; then
        sudo apt install -y gnome-software-plugin-flatpak
    fi

    echo "- Instalação do flatpak concluída"
else
    echo "- O flatpak já está instalado"
fi