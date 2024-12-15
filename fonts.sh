#!/bin/bash

# Download and extract JetBrainsMono Nerd Font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir -p /usr/share/fonts/truetype/JetBrainsMonoNerdFont
sudo tar -xf JetBrainsMono.tar.xz -C /usr/share/fonts/truetype/JetBrainsMonoNerdFont
rm JetBrainsMono.tar.xz

# Update font cache
sudo fc-cache -f -v
