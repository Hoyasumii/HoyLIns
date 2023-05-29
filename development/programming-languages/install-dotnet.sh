#!/bin/bash

echo "- Instalação do .NET 7.0"

sudo apt-get update -y

sudo apt-get install -y dotnet-sdk-7.0
echo "- .NET SDK 7.0: instalado"

sudo apt-get install -y aspnetcore-runtime-7.0
echo "- aspnetcore-runtime-7.0: instalado"

echo "- Instalação do .NET 7.0 concluída com sucesso!"
 