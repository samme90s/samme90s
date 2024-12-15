#!/bin/bash

# Download and extract JetBrainsMono Nerd Font
sudo curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
sudo mkdir -p /usr/share/fonts/truetype/JetBrainsMonoNerdFont
sudo tar -xf JetBrainsMono.tar.xz -C /usr/share/fonts/truetype/JetBrainsMonoNerdFont
sudo rm JetBrainsMono.tar.xz

# Update font cache
sudo fc-cache -f -v

# Verify installation
sudo fc-list | grep "JetBrains"
echo "Verify that the JetBrainsMono Nerd Font is listed above."
echo "If it is not listed, then the installation failed..."
