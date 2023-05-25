#!/bin/bash

echo "> Instalação do Python"

echo "1. Atualização do sistema"
sudo apt-get update
echo "> Atualização do sistema concluída"

sudo apt-get install python3 python3-pip python3-venv
echo "> Instalação do Python concluída"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"