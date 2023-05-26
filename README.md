## Como usar?
1. Abra o terminal
2. Copie e cole o comando referente ao script que você deseja executar
- **obs**: Os scripts relacionados a desenvolvimento apenas instalam os softwares básicos para produção, como o **kit de desenvolvimento** e o **runtime**.
---
## Pré-requisitos:
1. Tenha o `curl` instalado
```bash
sudo apt install curl
```
---
## Lista de scripts:
### 1. Essencial:
- Instala e configura: `git`, `vscode`, `docker`, `chave SSH que será usada para o GitHub e Bitbucket` e o `ZSH`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/base-install.sh)"
```
### 2. Para uso cotidiano:
- Instala: `Discord`, `Spotify`, `Obsidian` e `Solaar(para dispositivos Logitech)`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/daily-use.sh)"
```
### 3. Para jogos:
- Instala: `Steam`, `Lutris`, `Wine`, `DXVK`, `Mesa Vulkan Drivers`, `Nvidia Drivers` e `Gamemode`
```bash
"A implementar"
```
### 4. Para desenvolvedores:
> **Node.js**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/install-node.sh)"
> ```
> **Python**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/install-python.sh)"
> ```
> **Java**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/install-java.sh)"
> ```
> **.NET**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/install-dotnet.sh)"
> ```
> **PHP**
> ```bash
> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/install-php.sh)"
> ```
### 5. Ferramentar para desenvolvedores:
- Instala: `Postman`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/development/development-tools.sh)"
```