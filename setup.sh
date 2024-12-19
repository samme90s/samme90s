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

install_clang() {
    sudo apt-get install clang -y
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

install_fnm() {
    curl -fsSL https://fnm.vercel.app/install | bash
    source $HOME/.bashrc
}

install_fzf() {
    sudo apt-get install fzf -y
}

install_jq() {
    sudo apt-get install jq -y
}

install_lua() {
    sudo apt-get install lua5.4 -y
}

install_luarocks() {
    sudo apt-get install luarocks -y
}

install_neovim() {
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    # Remove old and unzip tar file
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    # Set nvim to PATH by creating a symbolic link
    sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
    rm -f nvim-linux64.tar.gz
}

install_nodejs() {
    fnm use --install-if-missing 22
}

install_python3_pip() {
    sudo apt-get install python3-pip -y
}

install_pipx() {
    sudo apt install pipx -y &&
        pipx ensurepath
}

install_poetry() {
    pipx install poetry
    pipx upgrade poetry
    poetry completions bash >>$HOME/.bash_completion
}

install_ripgrep() {
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb &&
        sudo dpkg -i ripgrep_14.1.0-1_amd64.deb &&
        rm ripgrep_14.1.0-1_amd64.deb
}

install_ruby() {
    sudo apt-get install ruby-full -y
}

install_sdkman() {
    sudo apt install zip unzip &&
        curl -s "https://get.sdkman.io" | bash &&
        source $HOME/.sdkman/bin/sdkman-init.sh
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
# Essentials, these need to be installed first
install_package "Python3-Pip" "pip3" install_python3_pip
install_package "Pipx" "pipx" install_pipx
install_package "Node.js" "node" install_nodejs
install_package "SDKMAN" "sdk" install_sdkman
# Tools
install_package "Bat" "bat" install_bat
install_package "Clang" "clang" install_clang
install_package "Docker" "docker" install_docker
install_package "FD-find (fd)" "fdfind" install_fd_find
install_package "FNM" "fnm" install_fnm
install_package "FuzzyFinder (fzf)" "fzf" install_fzf
install_package "JQ" "jq" install_jq
install_package "Lua" "lua" install_lua
install_package "LuaRocks" "luarocks" install_luarocks
install_package "Neovim" "nvim" install_neovim
install_package "Poetry" "poetry" install_poetry
install_package "RipGrep" "rg" install_ripgrep
install_package "Ruby" "ruby" install_ruby

# SETUP
########################################
# Clone or update repository
DIR="$HOME/dev/setup"
GIT_URI="git@github.com:samme90s/setup.git"
# Check if the directory exists
if [ -d "$DIR/.git" ]; then
    println $YELLOW "Pulling ($GIT_URI > $DIR)"
    git -C "$DIR" pull &&
        print $GREEN "Pulling ($GIT_URI > $DIR) - complete"
else
    println $YELLOW "Cloning ($GIT_URI > $DIR)"
    git clone "$GIT_URI" "$DIR" &&
        print $GREEN "Cloning ($GIT_URI > $DIR) - complete"
fi

# Copy alacritty configuration
USER=$(whoami)
ALACRITTY_SRC="$DIR/imports/alacritty.toml"
ALACRITTY_DEST="/mnt/c/Users/$USER/AppData/Roaming/alacritty/alacritty.toml"
# Check if the alacritty configuration file has changed
if rsync -aci --dry-run $ALACRITTY_SRC $ALACRITTY_DEST | grep -q '^>f'; then
    mkdir -p $(dirname $ALACRITTY_DEST) &&
        rsync -v $ALACRITTY_SRC $ALACRITTY_DEST &&
        print $GREEN "Alacritty configuration copied"
fi

# END
########################################
print $GREEN "Setup complete!"
print $RED "Please restart your terminal to apply any hanging changes!"

println $BLUE "######################################################################"
print $BLUE "Import any custom configurations from the cloned repository to Windows"
# Disable strict error handling
print $BLUE "Strict error handling disabled"
set +e
