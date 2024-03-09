# My AstroNvim User Configuration

My user configuration for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
# Linux
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Windows
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

#### Clone AstroNvim

```shell
# Linux
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Windows
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $env:LOCALAPPDATA\nvim
```

#### Clone user configuration

```shell
# Linux
git clone https://github.com/MaoX-Yu/astronvim-config.git ~/.config/nvim/lua/user

# Windows
git clone https://github.com/MaoX-Yu/astronvim-config.git $env:LOCALAPPDATA\nvim\lua\user
```

#### Start Neovim

```shell
nvim
```
