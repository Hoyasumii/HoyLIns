#!/bin/bash

echo "> Instalação do .NET 7.0"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/update-checker.sh)"

sudo apt-get install -y dotnet-sdk-7.0
echo "> .NET SDK 7.0: instalado"

sudo apt-get install -y aspnetcore-runtime-7.0
echo "> aspnetcore-runtime-7.0: instalado"

echo "> Instalação do .NET 7.0 concluída com sucesso!"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"