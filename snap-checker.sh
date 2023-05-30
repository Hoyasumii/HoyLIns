#!/bin/bash

echo "- Verificando se o snap está instalado e o instalando caso não esteja"

if ! [ -x "$(command -v snap)" ]; then
    echo "- O snap não está instalado. Instalando..."
    sudo apt install -y snapd
    
    read -n 1 -p "- Deseja instalar o plugin do snap para ele aparecer na Gnome Software? (y/ANY) " snap_plugin
    if [[ "$snap_plugin" == "y" ]]; then
        sudo apt install -y gnome-software-plugin-snap
    fi

    echo "- Instalação do snap concluída"
else
    echo "- O snap já está instalado"
fi