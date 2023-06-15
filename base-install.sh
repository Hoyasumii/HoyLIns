#!/bin/bash

echo "- HoyLins: Instalação base"
read -n 1 -p "1. O script irá instalar e configurar os seguintes programas: Git, Docker e as linguagens de programação que você escolher. Deseja continuar? " initial_answer
echo ""

# Ele vai verificar  qual dos gerenciadores de pacotes está instalado e vai usar ele. Caso não seja apt ou dnf, ele vai avisar que o script não tem suporte

if [ -x "$(command -v apt)" ]; then
    package="apt"
elif [ -x "$(command -v dnf)" ]; then
    package="dnf"
else
    echo "- O gerenciador de pacotes do seu sistema não é suportado por esse script. Caso você queira adicionar suporte para o seu gerenciador de pacotes, abra uma issue no GitHub: https://github.com/Hoyasumii/HoyLins/issues/new"
    exit 1
fi

# if [[ "$git_config" == "y" ]]; then
if [[ "$initial_answer" != "y" ]]; then
    echo "- Obrigado por usar o script!"
    exit 0
fi

sudo $package update -y

sudo $package install -y git 
echo "- Git instalado"

exit 0

if [[ "$package" == 'apt' ]]; then
    sudo apt install ca-certificates gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update -y
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
else
    sudo dnf -y install dnf-plugins-core
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

echo "- Docker instalado"

echo "2. Configuração do ambiente"

read -n 1 -p "- Você quer configurar o git? (y/ANY) " git_config
echo ""

if [[ "$git_config" == "y" ]]; then
    while true; do
        read -p "- Escolha o nome de usuário do git: " git_user
        read -p "- Escolha o email do usuário do git: " git_email

        if ! [[ "$git_user" == "" || "$git_email" == "" ]]; then
            break
        else 
            echo "- Você precisa preencher os campos de usuário e email"
        fi
    done

    git config --global user.name "$git_user"
    git config --global user.email "$git_email"
    git config --global init.defaultBranch main
    
    echo "- Git configurado"
fi

read -n 1 -p "- Você quer criar uma chave SSH para configuração do GitHub, BitBucket e afins? (y/ANY) " ssh_keys
echo ""

if [[ "$ssh_keys" == "y" ]]; then
    if [[ "$git_email" == "" ]]; then
        read -p "- Digite o email que você quer usar para criar as chaves SSH: " git_email
    else
        read -p "- Você quer usar o email do git para criar as chaves SSH? (y/ANY) " ssh_has_git_email

        if [[ "$ssh_has_git_email" == "y" ]]; then
            git_email=$git_email
        else
            read -p "- Digite o email que você quer usar para criar as chaves SSH: " git_email
        fi
    fi

    read -p "- Escolha o nome da chave SSH: " ssh_key_name
    ssh-keygen -t ed25519 -b 4096 -C "$git_email" -f ~/.ssh/$ssh_key_name
    echo "- Chaves SSH criadas"
    
    echo "- Adicionando a chave SSH ao ssh-agent"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/$ssh_key_name
    echo "- Chave SSH adicionada ao ssh-agent"

    cat ~/.ssh/$ssh_key_name.pub | xclip -selection clipboard # Copia a chave pública para o clipboard
    cat ~/.ssh/$ssh_key_name.pub > ~/$ssh_key_name.txt # Lança a chave pública em um arquivo de texto na home do usuário
fi

echo "- Configuração concluída com sucesso!"

echo "3. Instalação de linguagens de programação"


echo "- Muito obrigado por usar esse script! Caso tenha gostado do script, deixe uma estrela no GitHub: https://github.com/Hoyasumii/HoyLins"