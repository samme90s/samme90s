#!/bin/bash

DIR="$HOME/dev"
GIT_REPO="setup"
GIT_URI="git@github.com:samme90s/$GIT_REPO.git"

echo $DIR
echo $GIT_REPO
echo $GIT_URI

# Public tools
#
# Update and upgrade
echo "Installing public tools"
echo "Updating and upgrading..."

sudo apt-get update &&
    sudo apt-get upgrade -y &&
    echo "Update and upgrade complete"

# Install Bat
echo "Installing Bat..."

sudo apt install bat -y &&
    echo "Bat installed"

# Setup
#
# Check if the directory exists
if [ -d $DIR ]; then
    echo "Directory exists"
else
    echo "Directory does not exist. Creating..."
    mkdir $DIR &&
        echo "Directory created"
fi

echo "Moving to '$DIR'..."
cd $DIR

# Check if the directory is empty
if [ "$(ls -A $DIR)" ]; then
    echo "Directory is not empty. Skipping cloning..."
else
    echo "Directory is empty. Cloning..."
    git clone $GIT_URI &&
        echo "Cloned '$GIT_REPO'"
fi

echo "Setup complete."
