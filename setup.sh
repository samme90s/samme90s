#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored messages
print_colored() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to check if a package is installed
is_installed() {
    dpkg -l | grep -q "^ii  $1 "
}

# Function to check if a command is available in PATH.
# This is an alternative to the is_installed() function.
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

DIR="$HOME/dev"
GIT_REPO="setup"
GIT_URI="git@github.com:samme90s/$GIT_REPO.git"

print_colored $BLUE "Directory: $DIR"
print_colored $BLUE "Git Repository: $GIT_REPO"
print_colored $BLUE "Git URI: $GIT_URI"

# Public tools
#
# Update and upgrade
print_colored $YELLOW "Installing public tools"
print_colored $YELLOW "Updating and upgrading..."

sudo apt-get update &&
    sudo apt-get upgrade -y &&
    print_colored $GREEN "Update and upgrade complete"

# Install Bat
BAT_PKG="bat"

if is_installed $BAT_PKG; then
    print_colored $GREEN "$BAT_PKG is already installed"
else
    print_colored $YELLOW "Installing $BAT_PKG..."
    sudo apt install bat -y &&
        print_colored $GREEN "$BAT_PKG installed"
fi

# Install RipGrep
RIPGREP_PKG="ripgrep"

if is_installed $RIPGREP_PKG; then
    print_colored $GREEN "$RIPGREP_PKG is already installed"
else
    print_colored $YELLOW "Installing $RIPGREP_PKG..."
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb &&
        sudo dpkg -i ripgrep_14.1.0-1_amd64.deb &&
        rm ripgrep_14.1.0-1_amd64.deb &&
        print_colored $GREEN "$RIPGREP_PKG installed"
fi

# Install LazyGit
LAZYGIT_PKG="lazygit"

if command_exists $LAZYGIT_PKG; then
    print_colored $GREEN "$LAZYGIT_PKG is already installed"
else
    print_colored $YELLOW "Installing $LAZYGIT_PKG..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*') &&
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" &&
        tar xf lazygit.tar.gz lazygit &&
        sudo install lazygit -D -t /usr/local/bin/ &&
        rm lazygit.tar.gz &&
        rm lazygit &&
        print_colored $GREEN "$LAZYGIT_PKG installed"
fi

# Install FD-find (fd)
FD_PKG="fd-find"

if is_installed $FD_PKG; then
    print_colored $GREEN "$FD_PKG is already installed"
else
    print_colored $YELLOW "Installing $FD_PKG..."
    sudo apt install fd-find -y &&
        print_colored $GREEN "$FD_PKG installed"
fi

# Install JQ
JQ_PKG="jq"

if is_installed $JQ_PKG; then
    print_colored $GREEN "$JQ_PKG is already installed"
else
    print_colored $YELLOW "Installing $JQ_PKG..."
    sudo apt-get install jq -y &&
        print_colored $GREEN "$JQ_PKG installed"
fi

# Install FuzzyFinder (fzf)
FZF_PKG="fzf"

if is_installed $FZF_PKG; then
    print_colored $GREEN "$FZF_PKG is already installed"
else
    print_colored $YELLOW "Installing $FZF_PKG..."
    sudo apt install fzf -y &&
        print_colored $GREEN "$FZF_PKG installed"
fi

# Setup
#
# Check if the directory exists
if [ -d "$DIR" ]; then
    print_colored $GREEN "Directory exists"
else
    print_colored $RED "Directory does not exist. Creating..."
    mkdir "$DIR" &&
        print_colored $GREEN "Directory created"
fi

cd "$DIR" &&
    print_colored $GREEN "Moved to '$DIR'"

# Check if the directory is empty
if [ "$(ls -A "$DIR")" ]; then
    print_colored $YELLOW "Directory is not empty. Skipping cloning..."
else
    print_colored $YELLOW "Directory is empty. Cloning..."
    git clone "$GIT_URI" &&
        print_colored $GREEN "Cloned '$GIT_REPO'"
fi

cd "$DIR/$GIT_REPO" &&
    print_colored $YELLOW "Moved to '$DIR/$GIT_REPO'"

print_colored $GREEN "Setup complete!"
