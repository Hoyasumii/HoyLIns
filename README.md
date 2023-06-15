# HoyLIns
- **Hoy**asumii's **L**inux **Ins**taller
- Um script que instala e configura tudo que um desenvolvedor precisa em um sistema Linux.
- **obs**: O script foi feito para ser usado em sistemas baseados com os gerenciadores de pacotes **apt (Ubuntu, Debian, PopOS)** ou **dnf (Fedora, Red Hat Entreprise Linux)**. Se você usa outro gerenciador de pacote, como o **pacman**, sinta-se livre para adaptar o script para sua distro.
---
## Como funciona?
- O script irá perguntar o que você deseja fazer e irá instalar tudo que você pedir.
- **obs**: O script não irá instalar nada sem sua permissão.
---
## Pré-requisitos:
1. Verifique se o `curl` está instalado
```bash
curl --version
```
2. Caso não esteja instalado, instale-o
```bash
sudo apt install curl
```
ou
```bash
sudo dnf install curl
```
---
## Como usar?
1. Abra o terminal
2. Copie e cole o comando referente ao script que você deseja executar
- **obs**: Os scripts relacionados a desenvolvimento apenas instalam os softwares básicos para produção, como o **kit de desenvolvimento** e o **runtime**.
---
## Lista de scripts:
### 1. Essencial:
- Instala e configura: `git`, `vscode`, `docker`, `chave SSH que será usada para o GitHub e Bitbucket` e no final, pergunta se você deseja usar o script de desenvolvimento
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/base-install.sh)"
```
- **Dica**: Se quiser melhorar a aparência do Terminal, sugiro que instale os seguintes softwares/plugins: `oh-my-zsh`, `powerlevel10k`, `zsh-autosuggestions`, `zsh-syntax-highlighting` e `zsh-completions`
### 2. Para uso cotidiano:
- Instala: `Discord`, `Spotify`, `Obsidian`, `Navegador a escolha`, `Solaar para configurar dispositivos da Logitech`, `Steam`, `Todoist` e `MEGAsync`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/daily-use.sh)"
```
### 3. Para desenvolvedores:
- Instala: `.NET`, `Java`, `Node.js`, `PHP`, `Python`, `Rust`, `C/C++`, `MySQL` e `PostgreSQL`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development-installer.sh)"
```
### 4. Ferramentar para desenvolvedores:
- Instala: `Postman`, `Insomnia`, `DBeaver Community Edition`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development-tools.sh)"
```

##### Implementar:
    read -n 1 -p "- Deseja instalar o plugin do flatpak para ele aparecer na Gnome Software? (y/ANY) " flatpak_plugin
    if [[ "$flatpak_plugin" == "y" ]]; then
        sudo PKM install -y gnome-software-plugin-flatpak
    fi