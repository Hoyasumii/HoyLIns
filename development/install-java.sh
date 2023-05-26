#!/bin/bash

echo "> Instalação do Java"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/update-checker.sh)"

sudo apt install default-jdk -y
echo "> Java Development Kit: instalado"

sudo apt install default-jre -y
echo "> Java Runtime Environment: instalado"

echo "> Instalação do Java concluída com sucesso!"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"

