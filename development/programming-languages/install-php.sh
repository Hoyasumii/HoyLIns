echo "- Instalação do PHP"
sudo PKM install php php-cli php-json php-xml php-curl php-mbstring -y
echo "- PHP: instalado"
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
echo "- Composer: instalado"
echo "- Instalação do PHP concluída com sucesso!"
 