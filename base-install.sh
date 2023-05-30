#!/bin/bash

echo "- Instalação inicial do sistema"
echo "1. Escolha o que você quer instalar:"

options=("git", "vscode", "docker")
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
    question "$item"
    answers+=($?)
    counter=$(($counter + 1))
done

echo "2. Preparando ambiente para instalação"

sudo apt-get update -y

echo "3. Instalando os programas selecionados"

if [[ "${answers[0]}" == "1" ]]; then
    sudo apt install -y git
fi

if [[ "${answers[1]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/snap-checker.sh)"
    sudo snap install code --classic
fi

if [[ "${answers[2]}" == "1" ]]; then
    sudo apt-get install ca-certificates gnupg -y

    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update -y
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
fi

echo "4. Configuração do ambiente"

if [[ "${answers[0]}" == "1" ]]; then
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
        echo "##############################################"
    fi
fi

read -n 1 -p "- Você quer criar uma chave SSH para configuração do GitHub, BitBucket e afins? (y/ANY) " ssh_keys
echo ""

if [[ "$ssh_keys" == "y" ]]; then
    echo "- Criando as chaves SSH"

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
echo "- Muito obrigado por usar esse script! Caso tenha gostado do script, deixe uma estrela no GitHub: https://github.com/Hoyasumii/essencial-ubuntu"