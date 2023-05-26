#!/bin/bash

echo "> Instalação do Python"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/update-checker.sh)"

sudo apt-get install python3 python3-pip python3-venv -y
echo "> Instalação do Python concluída com sucesso!"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"