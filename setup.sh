#!/bin/bash

# Enable strict error handling
set -e

# COLORS
########################################
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# GENERAL FUNCTIONS
########################################
print() {
    # Function to print colored messages
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

println() {
    # Function to print colored messages
    local color=$1
    local message=$2
    echo ""
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
    local pkg=$2
    local install_function=$3

    if is_installed "$pkg" || command_exists "$pkg"; then
        print $GREEN "$name is already installed"
    else
        print $YELLOW "Installing $name..."
        $install_function
        print $GREEN "$name installed"
    fi
}

# PACKAGES
########################################
install_bat() {
    sudo apt-get install bat -y
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

install_fd_find() {
    sudo apt-get install fd-find -y
}

install_fzf() {
    sudo apt-get install fzf -y
}

install_jq() {
    sudo apt-get install jq -y
}

# INSTALLATION OF PACKAGES
########################################
# General messages
println $BLUE "Strict error handling enabled"

# Update packages
print $YELLOW "Installing public tools"
print $YELLOW "Updating packages"
sudo apt-get update &&
print $GREEN "Updating packages - complete"

# Install packages using the generic function with specific functions for each installation.
# install_package "Name" "Package Name" "Command Name" "Install Function"
#
# Tools
install_package "Bat" "bat" install_bat
install_package "Docker" "docker" install_docker
install_package "FD-find (fd)" "fdfind" install_fd_find
install_package "FuzzyFinder (fzf)" "fzf" install_fzf
install_package "JQ" "jq" install_jq

# Copy alacritty configuration
USER=$(whoami)
ALACRITTY_SRC="./imports/alacritty.toml"
ALACRITTY_DEST="$HOME/.config/alacritty/alacritty.toml"
# Check if the alacritty configuration file has changed
if rsync -aci --dry-run $ALACRITTY_SRC $ALACRITTY_DEST | grep -q '^>f'; then
    mkdir -p $(dirname $ALACRITTY_DEST) &&
        rsync -v $ALACRITTY_SRC $ALACRITTY_DEST &&
        print $GREEN "Alacritty configuration copied"
fi

# END
########################################
print $GREEN "Setup complete!"
print $GREEN "Please restart your terminal to apply any hanging changes!"

# Disable strict error handling
println $BLUE "Strict error handling disabled"
set +e
