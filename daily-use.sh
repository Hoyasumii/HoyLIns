

echo "- Instalação dos aplicativos que são usados diariamente"
echo "- obs.: A instalação de todos os aplicativos, será por meio de flatpaks ou PKM e o flatpak-checker, um script responsável por instalar o flatpak caso ele não esteja em sua máquina, será executado no início da instalação."
echo "1. Escolha o que você quer instalar:"

options=("Discord", "Spotify", "Obsidian", "Google Chrome", "Microsoft Edge", "Mozilla Firefox", "Opera", "Solaar para configurar dispositivos da Logitech", "Steam", "Todoist", "MEGAsync")
answers=()

function question() {

    read -n 1 -p "- $1 (y/ANY) " answer
    echo ""
    if [[ "$answer" == "y" ]]; then
        return 1
    else
        return 0
    fi

}

counter=0
for item in "${options[@]}"; do
    if [[ $counter -ge 3 && $counter -le 6 ]]; then
        if [[ "${answers[0]}" == "1" ]]; then
            question "Navegador $item"
        fi
    else
        question "$item"
    fi
    answers+=($?)
    counter=$(($counter + 1))
done

echo "2. Preparando ambiente para instalação"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/flatpak-checker.sh)"

echo "3. Instalando os programas selecionados"

if [[ "${answers[0]}" == "1" ]]; then
    flatpak install flathub com.discordapp.Discord -y
fi

if [[ "${answers[1]}" == "1" ]]; then
    flatpak install flathub com.spotify.Client -y
fi

if [[ "${answers[2]}" == "1" ]]; then
    flatpak install flathub md.obsidian.Obsidian -y
fi

if [[ "${answers[3]}" == "1" ]]; then
    flatpak install flathub com.google.Chrome -y
fi

if [[ "${answers[4]}" == "1" ]]; then
    flatpak install flathub com.microsoft.Edge -y
fi

if [[ "${answers[5]}" == "1" ]]; then
    flatpak install flathub org.mozilla.firefox -y
fi

if [[ "${answers[6]}" == "1" ]]; then
    flatpak install flathub com.opera.Opera -y
fi

if [[ "${answers[7]}" == "1" ]]; then
    sudo PKM install solaar -y
fi

if [[ "${answers[8]}" == "1" ]]; then
    flatpak install flathub com.valvesoftware.Steam -y
fi

if [[ "${answers[9]}" == "1" ]]; then
    flatpak install flathub com.todoist.Todoist -y
fi

if [[ "${answers[10]}" == "1" ]]; then
    curl https://mega.nz/linux/repo/xUbuntu_23.04/amd64/megasync-xUbuntu_23.04_amd64.deb --output "MEGAsync.deb"
    sudo PKM install "MEGAsync.deb" -y
    rm "MEGAsync.deb"
fi

echo "- Tudo foi instalado com sucesso!"
echo "- Muito obrigado por usar esse script! Caso tenha gostado do script, deixe uma estrela no GitHub: https://github.com/Hoyasumii/essencial-ubuntu"