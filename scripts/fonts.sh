#!/bin/bash

FONT="JetBrainsMono"

# Download and extract Nerd Font
sudo curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT}.tar.xz
sudo mkdir -p /usr/share/fonts/truetype/${FONT}NerdFont
sudo tar -xf ${FONT}.tar.xz -C /usr/share/fonts/truetype/${FONT}NerdFont
sudo rm ${FONT}.tar.xz

# Update font cache
sudo fc-cache -f -v

# Verify installation
sudo fc-list | grep $FONT
echo "Verify that the $FONT Nerd Font is listed above."
echo "If it is not listed, then the installation failed..."
