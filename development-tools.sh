#!/bin/bash

echo "- Instalação de ferramentas de desenvolvimento"
echo "- Instalação dos aplicativos que são usados diariamente"
echo "- obs.: A instalação de todos os aplicativos, será por meio de flatpaks ou apt e o flatpak-checker, um script responsável por instalar o flatpak caso ele não esteja em sua máquina, será executado no início da instalação."
echo "1. Escolha o que você quer instalar:"

options=("Postman", "Insomnia", "DBeaver Community Edition")
answers=()

function question() {

    read -n 1 -p "- $1 (y/ANY) " answer
    echo ""
    if [[ "$answer" == "y" ]]; then
        return 1
    else
        return 0
    fi

}

counter=0
for item in "${options[@]}"; do
    question "$item"
    answers+=($?)
    counter=$(($counter + 1))
done

echo "2. Preparando ambiente para instalação"
sudo apt-get update -y
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/flatpak-checker.sh)"

echo "3. Instalando os programas selecionados"

if [[ "${answers[0]}" == "1" ]]; then
    flatpak install flathub com.getpostman.Postman
fi

if [[ "${answers[1]}" == "1" ]]; then
    flatpak install flathub com.insomnia.Insomnia
fi

if [[ "${answers[2]}" == "1" ]]; then
    flatpak install flathub io.dbeaver.DBeaverCommunity
fi

echo "- Instalação finalizada!"
echo "- Muito obrigado por usar esse script! Caso tenha gostado do script, deixe uma estrela no GitHub: https://github.com/Hoyasumii/essencial-ubuntu"