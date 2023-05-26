#!/bin/bash

echo "> Instalação do Node.js"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/update-checker.sh)"

sudo apt-get install nodejs npm -y
echo "> Instalação do Node.js concluída com sucesso!"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"