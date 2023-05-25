if ! [ -x "$(command -v snap)" ]; then
    echo "> O snapd não está instalado. Instalando..."
    sudo apt install -y snapd
    echo "> Instalação do snapd concluída"
else
    echo "> O snapd já está instalado"
fi

if ! [ -x "$(command -v flatpak)" ]; then
    echo "> O flatpak não está instalado. Instalando..."
    sudo apt install -y flatpak
    
    read -p "> Deseja instalar o plugin do flatpak para ele aparecer na loja do Ubuntu? (y/ANY) " flatpak_plugin
    if [[ "$flatpak_plugin" == "y" ]]; then
        sudo apt install -y gnome-software-plugin-flatpak
    fi

    echo "> Instalação do flatpak concluída"
else
    echo "> O flatpak já está instalado"
fi