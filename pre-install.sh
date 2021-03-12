#!/bin/bash

# Install zsh
echo "Installing zsh..."
sudo apt install zsh

# Install oh-my-zsh
echo 'Installing oh-my-zsh'
OMZDIR="$HOME/.oh-my-zsh"
rm -rf  $OMZDIR
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Remove defualt omz .zshrc
rm -f $HOME/.zshrc

# OMZ already does this automatically so kkk
# # Change default shell to zsh
# if [ ! $SHELL = "/usr/bin/zsh" ] 
# then
# 	echo 'Changing default shell to zsh'
# 	chsh -s $(which zsh)
# else
# 	echo 'Already using zsh'
# fi