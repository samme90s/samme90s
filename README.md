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

### Alacritty

```shell
# Make sure the directory exists
mkdir -p $HOME/.config/alacritty &&
# Copy the file to the new location
# (this will replace any existing one)
cp -f ./imports/alacritty/alacritty.toml $HOME/.config/alacritty
```

### Ghostty

```shell
# Make sure the directory exists
mkdir -p $HOME/.config/ghostty &&
# Copy the file to the new location
# (this will replace any existing one)
cp -f ./imports/ghostty/config $HOME/.config/ghostty
```
