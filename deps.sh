#!/bin/bash

unset ZSH

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh

# Install p10k font
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20{Regular,Bold,Italic,Bold%20Italic}.ttf
mv "MesloLGS NF "{Regular,Bold,Italic,Bold%20Italic}.ttf /usr/share/fonts
fc-cache

# Install oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh 
chmod +x install.sh
sh install.sh --unattended
