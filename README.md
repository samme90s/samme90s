# Setup

## Clone

```shell
# Clone repository
git clone git@github.com:samme90s/setup.git &&
cd setup
```

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
echo "eval \$(keychain --eval --agents ssh id_ed25519)" >> $HOME/.bashrc
```

## Fonts

```shell
# Only use for Ubuntu!
# Or verify the script beforehand.
source fonts.sh
```

## Other (~/.bashrc)

```shell
# Uncomment
force_color_prompt=yes
```

## Imports

### Wezterm

`%USERPROFILE%\.wezterm.lua`

## Third party tools

```shell
# Open an administrative shell, then run the following commands:
#
# With PowerShell, you must ensure Get-ExecutionPolicy is not Restricted.
# We suggest using Bypass to bypass the policy to get things installed or
# AllSigned for quite a bit more security.
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install bat
choco install jq
```
