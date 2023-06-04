

echo "- Verificando se o flatpak está instalado e o instalando caso não esteja"

if ! [ -x "$(command -v flatpak)" ]; then
    echo "- O flatpak não está instalado. Instalando..."
    sudo PKM install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    echo "- Instalação do flatpak concluída"
else
    echo "- O flatpak já está instalado"
fi