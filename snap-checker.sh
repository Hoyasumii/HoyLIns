

echo "- Verificando se o snap está instalado e o instalando caso não esteja"

if ! [ -x "$(command -v snap)" ]; then
    echo "- O snap não está instalado. Instalando..."
    sudo PKM install -y snapd
    echo "- Instalação do snap concluída"
else
    echo "- O snap já está instalado"
fi