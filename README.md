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
- Instala e configura: `git`, `vscode`, `docker`, `chave SSH que será usada para o GitHub e Bitbucket`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/base-install.sh)"
```
- **Dica**: Se quiser melhorar a aparência do Terminal, sugiro que instale os seguintes softwares/plugins: `oh-my-zsh`, `powerlevel10k`, `zsh-autosuggestions`, `zsh-syntax-highlighting` e `zsh-completions`
### 2. Para uso cotidiano:
- Instala: `Discord`, `Spotify`, `Obsidian`, `Navegador a escolha`, `Solaar para configurar dispositivos da Logitech`, `Steam`, `Todoist` e `MEGAsync`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/daily-use.sh)"
```
### 4. Para desenvolvedores:
> **Node.js**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/programming-languages/install-node.sh)"
> ```
> **Python**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-python.sh)"
> ```
> **Java**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-java.sh)"
> ```
> **.NET**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-dotnet.sh)"
> ```
> **PHP**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-php.sh)"
> ```
> **Rust**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/install-rust.sh)"
> ```
### 5. Ferramentar para desenvolvedores:
- Instala: `Postman`, `Insomnia`, `DBeaver Community Edition`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/programming-languages/development-tools.sh)"
```