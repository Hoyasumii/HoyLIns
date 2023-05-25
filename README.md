## Como usar?
1. Abra o terminal
2. Copie e cole o comando referente ao script que você deseja executar
- **obs**: Todos os scripts também irão checar se o snapd e o flatpak estão instalados, caso não estejam, eles serão instalados.
---
## Lista de scripts:
### 1. Essencial:
- Instala e configura: `git`, `vscode`, `docker`, `chave SSH que será usada para o GitHub e Bitbucket` e o `ZSH`
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hoyasumii/essencial-ubuntu/main/base-install.sh)"
```
### 2. Para uso cotidiano:
- Instala: `Discord`, `Spotify` e `Obsidian`
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