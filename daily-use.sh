#!/bin/bash

echo "> Instalação dos aplicativos que são usados diariamente"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/basics.sh)"

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