#!/bin/bash

echo "- Instalação do Java"

sudo apt-get update -y

sudo apt install default-jdk -y
echo "- Java Development Kit: instalado"

sudo apt install default-jre -y
echo "- Java Runtime Environment: instalado"

echo "- Instalação do Java concluída com sucesso!"
 