#!/bin/bash

echo "> Instalação inicial do sistema"
echo "1. Escolha o que você quer instalar:"

options=("git", "vscode" "docker" "ZSH")
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

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/update-checker.sh)"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/flatpak-checker.sh)"

echo "3. Instalando os programas selecionados"

if [[ "${answers[0]}" == "1" ]]; then
    sudo apt install -y git
fi

if [[ "${answers[1]}" == "1" ]]; then
    flatpak install flathub com.visualstudio.code -y
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

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
fi

if [[ "${answers[3]}" == "1" ]]; then
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "3. Configuração do ambiente"

read -n 1 -p "- Você quer configurar o git? (y/ANY) " git_config

if [[ "$git_config" == "y" ]]; then
    while true; do
        read -p "- Escolha o nome de usuário do git: " git_user
        read -p "- Escolha o email do usuário do git: " git_email

        if ! [[ "$git_user" == "" || "$git_email" == "" ]]; then
            break
        else 
            echo "> Você precisa preencher os campos de usuário e email"
        fi
    done

    git config --global user.name "$git_user"
    git config --global user.email "$git_email"
    
    echo "- Git configurado"
    echo "##############################################"
fi

read -n 1 -p "- Você quer criar uma chave SSH para configuração do GitHub, BitBucket e afins? (y/ANY) " ssh_keys

if [[ "$ssh_keys" == "y" ]]; then
    echo "- Criando as chaves SSH"

    if [[ "$git_email" == "" ]]; then
        read -p "- Digite o email que você quer usar para criar as chaves SSH: " git_email
    else
        read -p "- Você quer usar o email do git para criar as chaves SSH? (y/ANY) " ssh_has_git_email

        if [[ "$ssh_has_git_email" == "y" ]]; then
            git_email=$git_email
        else
            read -p "> Digite o email que você quer usar para criar as chaves SSH: " git_email
        fi
    fi

    read -p "4.1.2. Escolha o nome da chave SSH: " ssh_key_name
    ssh-keygen -t ed25519 -b 4096 -C "$git_email" -f ~/.ssh/$ssh_key_name
    echo "> Chaves SSH criadas"
    
    echo "4.2. Adicionando a chave SSH ao ssh-agent"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/$ssh_key_name
    echo "> Chave SSH adicionada ao ssh-agent"

    echo "> Copie o conteúdo da chave pública e adicione ao GitHub, BitBucket e afins"
    cat ~/.ssh/$ssh_key_name.pub
fi

# echo "> Instalação inicial do sistema"


# echo "1. Instalação e configuração do git"
# echo "> Instalação do git concluída"

# # Um questionário inicial perguntando o que o usuário quer instalar. Depois, era só executar tudo de uma vez


# read -p "1.1. Você quer configurar o git? (y/ANY) " git_config

# if [[ "$git_config" == "y" ]]; then
#     while true; do
#         read -p "1.2. Escolha o nome de usuário do git: " git_user
#         read -p "1.3. Escolha o email do usuário do git: " git_email

#         if ! [[ "$git_user" == "" || "$git_email" == "" ]]; then
#             break
#         else 
#             echo "> Você precisa preencher os campos de usuário e email"
#         fi
#     done

#     git config --global user.name "$git_user"
#     git config --global user.email "$git_email"
    
#     echo "> Configuração do git concluída"
# fi

# read -p "2. Você quer instalar o vscode? (y/ANY) " vscode_install

# if [[ "$vscode_install" == "y" ]]; then
#     sudo snap install --classic code
#     echo "> Instalação do vscode concluída"
# fi

# read -p "3. Você quer instalar o docker em sua máquina? (y/ANY) " docker_install

# if [[ "$docker_install" == "y" ]]; then
#     echo "3.1. Preparando o ambiente para instalação do docker"
    
#     echo "3.1.1 Atualização dos pacotes + instalação dos pré-requisitos"
#     sudo apt-get update
#     sudo apt-get install ca-certificates gnupg

#     echo "3.1.2 Adicionando a chave GPG oficial do Docker"
#     sudo install -m 0755 -d /etc/apt/keyrings
#     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#     sudo chmod a+r /etc/apt/keyrings/docker.gpg

#     echo "3.1.3 Configurando o ambiente"
#     echo \
#     "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#     "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
#     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#     echo "3.2. Instalando o docker"
#     sudo apt-get update
#     sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#     echo "> Instalação do docker concluída"
#     echo "> Dica: Se quiser instalar também o Docker Desktop, acesse https://docs.docker.com/desktop/install/linux-install/"
#     read -n 1 -s -r -p "PRESSIONE QUALQUER TECLA PARA CONTINUAR"
#     echo ""
# fi

# read -p "4. Você quer criar uma chave SSH para configuração do GitHub, BitBucket e afins? (y/ANY) " ssh_keys

# if [[ "$ssh_keys" == "y" ]]; then
#     echo "4.1. Criando as chaves SSH"

#     if [[ "$git_email" == "" ]]; then
#         read -p "4.1.1. Digite o email que você quer usar para criar as chaves SSH: " git_email
#     else
#         read -p "4.1.1. Você quer usar o email do git para criar as chaves SSH? (y/ANY) " ssh_has_git_email

#         if [[ "$ssh_has_git_email" == "y" ]]; then
#             git_email=$git_email
#         else
#             read -p "> Digite o email que você quer usar para criar as chaves SSH: " git_email
#         fi
#     fi

#     read -p "4.1.2. Escolha o nome da chave SSH: " ssh_key_name
#     ssh-keygen -t ed25519 -b 4096 -C "$git_email" -f ~/.ssh/$ssh_key_name
#     echo "> Chaves SSH criadas"
    
#     echo "4.2. Adicionando a chave SSH ao ssh-agent"
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/$ssh_key_name
#     echo "> Chave SSH adicionada ao ssh-agent"

#     echo "> Copie o conteúdo da chave pública e adicione ao GitHub, BitBucket e afins"
#     cat ~/.ssh/$ssh_key_name.pub
# fi

# read -p "5. Você quer instalar o zsh e o oh-my-zsh para deixar o terminal mais bonito? (y/ANY) " zsh_install

# if [ "$zsh_install" == "y" ]; then
#     sudo apt install -y zsh
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#     echo "> Instalação do zsh e oh-my-zsh concluída"
#     echo "> Dica: Se quiser deixar o terminal mais bonito ainda, instale o zsh-syntax-highlight"
#     read -n 1 -s -r -p "~ PRESSIONE QUALQUER TECLA PARA CONTINUAR"
#     echo ""
# fi

# echo "> Tudo foi instalado com sucesso!"
# echo "> Caso queira instalar outros programas, leia o README.md do repositório(https://github.com/Hoyasumii/essencial-ubuntu) e veja as opções disponíveis"