#!/bin/bash

echo "- Instalação do Rust"

sudo apt-get update

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "- Rust Lang: instalado"

read -n 1 -p "Deseja também instalar o GCC, pois algumas bibliotecas em Rust necessitam do GCC para serem compiladas? (y/ANY) " gcc_install

if [[ "$gcc_install" == "y" ]]; then
    sudo apt install build-essential
    echo "- GCC: instalado"
fi

echo "- Instalação do Rust concluída com sucesso!"
echo "- Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"