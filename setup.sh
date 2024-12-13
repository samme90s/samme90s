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
print_colored $YELLOW "Installing Bat..."

sudo apt install bat -y &&
    print_colored $GREEN "Bat installed"

# Setup
#
# Check if the directory exists
if [ -d $DIR ]; then
    print_colored $GREEN "Directory exists"
else
    print_colored $RED "Directory does not exist. Creating..."
    mkdir $DIR &&
        print_colored $GREEN "Directory created"
fi

cd $DIR &&
    print_colored $GREEN "Moved to '$DIR'"

# Check if the directory is empty
if [ "$(ls -A $DIR)" ]; then
    print_colored $YELLOW "Directory is not empty. Skipping cloning..."
else
    print_colored $YELLOW "Directory is empty. Cloning..."
    git clone $GIT_URI &&
        print_colored $GREEN "Cloned '$GIT_REPO'"
fi

cd $DIR/$GIT_REPO &&
    print_colored $YELLOW "Moved to '$DIR/$GIT_REPO'"

print_colored $GREEN "Setup complete!"
