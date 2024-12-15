# Setup

## Pre-Requisites for WSL (Ubuntu 24.02 LTS)

- JetBrains Mono Nerd Font (Windows)
  1. USE GITHUB LATEST RELEASE
  2. DOWNLOAD .ZIP & EXTRACT
  3. INSTALL FOR ALL USERS
- Alacritty
- Bash (usually comes with Git)
- Git & configuration
- SSH & configuration

## Git

```shell
sudo apt-get update && \
sudo apt-get install git -y
```

```shell
git config --global user.email "email"
```

```shell
git config --global user.name "name"
```

```shell
git config --global core.editor "vim"
```

```shell
git config --global pull.rebase false
```

```shell
touch $HOME/.gitignore_global && \
echo ".idea/" >> $HOME/.gitignore_global && \
echo ".vscode/" >> $HOME/.gitignore_global && \
# Configure Git to use the global .gitignore
git config --global core.excludesfile $HOME/.gitignore_global && \
# To verify the file was correctly added
git config --global --list
```

## SSH

```shell
# Install keychain
sudo apt install keychain && \
# Change permissions, this is important for the ssh-agent to work!
chmod 700 $HOME/.ssh && \
chmod 600 $HOME/.ssh/*
```

```shell
# Append the Keychain Configuration (~/.bashrc):
echo "" >> $HOME/.bashrc && \
echo "# Ignore warnings if asymmetric key is missing!" >> $HOME/.bashrc && \
echo "# Auto start ssh agent and add keys" >> $HOME/.bashrc && \
echo "eval \$(keychain --eval --agents ssh id_ed25519 ss225ze-keypair.pem)" >> $HOME/.bashrc
```

## Usage

```shell
# Use only in Linux Distro!
source fonts.sh
source setup.sh
```

## Post-setup

### Enable transparency for Neovim

```lua
-- Add in ~/.config/nvim/lua/chadrc.lua
-- Before the "return M" statement
M.ui = {
  transparency = true, -- Enable transparency
}
```

```lua
-- Add last in ~/.config/nvim/init.lua

-- Enable transparency
vim.cmd [[
  highlight Normal guibg=none ctermbg=none
  highlight NonText guibg=none ctermbg=none
  highlight EndOfBuffer guibg=none ctermbg=none
]]
```

