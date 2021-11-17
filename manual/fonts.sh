#!/bin/bash

echo "Installing Meslo LGS Nerd Font..."

# Menlo nerd font
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O MesloRegular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O MesloBold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O MesloItalic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O MesloBoldItalic.ttf

mkdir /usr/share/fonts/Meslo
mv *.ttf $_

# Update font cache
echo "Updating font cache..."
fc-cache -f -v