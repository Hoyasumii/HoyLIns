## Como usar?
1. Abra o terminal
2. Copie e cole o comando referente ao script que você deseja executar
- **obs**: Os scripts relacionados a desenvolvimento apenas instalam os softwares básicos para produção, como o **kit de desenvolvimento** e o **runtime**.
3. Sobre os scripts: Eles irão perguntar o que você quer fazer. **Nenhum deles irá instalar algo em sua máquina sem sua permissão**.
---
## Pré-requisitos:
1. Tenha o `curl` instalado
```bash
sudo apt install curl
```
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