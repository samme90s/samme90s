#!/bin/bash

# Enable strict error handling
set -e

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# GENERAL FUNCTIONS
########################################
print_colored() {
    # Function to print colored messages
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

is_installed() {
    # Function to check if a package is installed
    dpkg -l | grep -q "^ii  $1 "
}

command_exists() {
    # Function to check if a command is available in PATH.
    command -v "$1" >/dev/null 2>&1
}

install_package() {
    # Function to install a package if it is not already installed.
    local name=$1
    local package_name=$2
    local command_name=$3
    local install_function=$4

    if is_installed "$package_name" || command_exists "$command_name"; then
        print_colored $GREEN "$name is already installed"
    else
        print_colored $YELLOW "Installing $name..."
        $install_function
        print_colored $GREEN "$name installed"
    fi
}

# PACKAGES
########################################
install_bat() {
    sudo apt install bat -y
}

install_ripgrep() {
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb &&
        sudo dpkg -i ripgrep_14.1.0-1_amd64.deb &&
        rm ripgrep_14.1.0-1_amd64.deb
}

install_lazygit() {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*') &&
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" &&
        tar xf lazygit.tar.gz lazygit &&
        sudo install lazygit -D -t /usr/local/bin/ &&
        rm lazygit.tar.gz &&
        rm lazygit
}

install_fd_find() {
    sudo apt install fd-find -y
}

install_jq() {
    sudo apt-get install jq -y
}

install_fzf() {
    sudo apt install fzf -y
}

install_fnm() {
    curl -fsSL https://fnm.vercel.app/install | bash
    source $HOME/.bashrc
}

install_nodejs() {
    fnm use --install-if-missing 22
}

install_python3_pip() {
    sudo apt install python3-pip -y
}

install_sdkman() {
    sudo apt install zip unzip &&
        curl -s "https://get.sdkman.io" | bash &&
        source $HOME/.sdkman/bin/sdkman-init.sh
}

install_docker() {
    # Add Docker's official GPG key:
    sudo apt-get update &&
        sudo apt-get install ca-certificates curl &&
        sudo install -m 0755 -d /etc/apt/keyrings &&
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc &&
        sudo chmod a+r /etc/apt/keyrings/docker.asc &&
        # Add the repository to Apt sources:
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null &&
        sudo apt-get update &&
        # To install the latest version, run:
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &&
        # Add current user to the Docker group:
        echo "Adding current user to the Docker group..." &&
        sudo usermod -aG docker $USER
}

DIR="$HOME/dev"
GIT_REPO="setup"
GIT_URI="git@github.com:samme90s/$GIT_REPO.git"
# Depending on the Windows username this may have to be changed!
USER=$(whoami)

print_colored $BLUE "Directory: $DIR"
print_colored $BLUE "Git Repository: $GIT_REPO"
print_colored $BLUE "Git URI: $GIT_URI"

# INSTALLATION OF PACKAGES
########################################
# Update and upgrade
print_colored $YELLOW "Installing public tools"
print_colored $YELLOW "Updating and upgrading..."
sudo apt-get update &&
    sudo apt-get upgrade -y &&
    print_colored $GREEN "Update and upgrade complete"

# Install packages using the generic function with specific functions for each installation.
# install_package "Name" "Package Name" "Command Name" "Install Function"
install_package "Bat" "bat" "bat" install_bat
install_package "RipGrep" "ripgrep" "rg" install_ripgrep
install_package "LazyGit" "" "lazygit" install_lazygit
install_package "FD-find (fd)" "fd-find" "fd" install_fd_find
install_package "JQ" "jq" "jq" install_jq
install_package "FuzzyFinder (fzf)" "fzf" "fzf" install_fzf
install_package "FNM" "fnm" "fnm" install_fnm
install_package "Node.js" "node" "node" install_nodejs
install_package "Python3-Pip" "pip3" "pip3" install_python3_pip
install_package "SDKMAN" "sdk" "sdk" install_sdkman
install_package "Docker" "docker" "docker" install_docker

# SETUP
########################################
# Check if the directory exists
mkdir -p "$DIR"

# Check if the directory is empty
if [ "$(ls -A "$DIR")" ]; then
    print_colored $YELLOW "Directory is not empty. Skipping cloning..."
else
    print_colored $YELLOW "Directory is empty. Cloning..."
    git clone "$GIT_URI" "$DIR/$GIT_REPO"
fi

# Copy configurations
print_colored $YELLOW "Copying configurations..."
print_colored $YELLOW "Checking if the directory exists..."
mkdir -p /mnt/c/Users/$USER/AppData/Roaming/alacritty/ &&
    print_colored $GREEN "Directory exists (or was created)" &&
    rsync -v $HOME/dev/setup/imports/alacritty.toml /mnt/c/Users/$USER/AppData/Roaming/alacritty/alacritty.toml &&
    print_colored $GREEN "Alacritty configuration copied"

print_colored $GREEN "Setup complete!"
print_colored $RED "Please restart your terminal to apply any hanging changes!"

print_colored $BLUE "Import any custom configurations from the cloned repository to Windows"
