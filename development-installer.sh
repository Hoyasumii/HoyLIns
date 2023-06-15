#!/bin/bash

echo "- Instalador para desenvolvedores"
echo "1. Escolha quais linguagens de programação que serão instaladas:"

options=(".NET", "Java", "Node.js", "PHP", "Python", "Rust", "C/C++")
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

if [[ "${answers[0]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-dotnet.sh)"
fi

if [[ "${answers[1]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-java.sh)"
fi

if [[ "${answers[2]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-node.sh)"
fi

if [[ "${answers[3]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-php.sh)"
fi

if [[ "${answers[4]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-python.sh)"
fi

if [[ "${answers[5]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-rust.sh)"
fi

if [[ "${answers[6]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-gcc.sh)"
fi

echo "- Instalação das linguagens de programação selecionadas concluídas com sucesso!"

echo "2. Escolha quais DBMS que serão instalados:"
echo "Nota: As configurações desses DBMS são feitas manualmente."

options=("MySQL", "PostgreSQL")
answers=()

counter=0
for item in "${options[@]}"; do
    question "$item"
    answers+=($?)
    counter=$(($counter + 1))
done

if [[ "${answers[0]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/database-management-systems/install-mysql.sh)"
fi

if [[ "${answers[1]}" == "1" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/database-management-systems/install-psql.sh)"
fi

echo "- Instalação dos DBMS selecionados concluídas com sucesso!"
echo "- Muito obrigado por usar esse script! Caso tenha gostado do script, deixe uma estrela no GitHub: https://github.com/Hoyasumii/essencial-ubuntu"