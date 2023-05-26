#!/bin/bash

echo "> Instalação do PHP"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/update-checker.sh)"

sudo apt install php php-cli php-json php-xml php-curl php-mbstring -y
echo "> PHP: instalado"

curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
echo "> Composer: instalado"

echo "> Instalação do PHP concluída com sucesso!"
echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"