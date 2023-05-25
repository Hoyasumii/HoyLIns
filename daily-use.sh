#!/bin/bash

echo "> Instalação dos aplicativos que são usados diariamente"

echo "1. Atualização do sistema"
sudo apt-get update
echo "> Atualização do sistema concluída"

echo "2. Verificando se o snapd e o flatpak estão instalados. Caso não estejam, serão instalados"



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