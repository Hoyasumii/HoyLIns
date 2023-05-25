#!/bin/bash

echo "> Instalação do Python"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/basics.sh)"

sudo apt-get install python3 python3-pip python3-venv
echo "> Instalação do Python concluída"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"