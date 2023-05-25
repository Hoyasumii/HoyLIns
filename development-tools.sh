#!/bin/bash

echo "> Instalação de ferramentas de desenvolvimento"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/basics.sh)"

read -p "3. Você quer instalar o Postman? (y/ANY) " postman_install

if [ "$postman_install" == "y" ]; then
    sudo snap install postman
    echo "> Instalação do Postman concluída"
fi

echo "> Instalação concluída"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"