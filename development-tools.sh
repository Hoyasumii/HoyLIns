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
    if [[ $counter -ge 3 && $counter -le 6 ]]; then
        if [[ "${answers[0]}" == "1" ]]; then
            question "Navegador $item"
        fi
    else
        question "$item"
    fi
    answers+=($?)
    counter=$(($counter + 1))
done

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/flatpak-checker.sh)"

read -p "3. Você quer instalar o Postman? (y/ANY) " postman_install

if [ "$postman_install" == "y" ]; then
    sudo snap install postman
    echo "- Instalação do Postman concluída"
fi
# TODO: Adicionar o DBeaver
echo "- Instalação concluída"
echo "- Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"