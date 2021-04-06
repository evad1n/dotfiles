#!/bin/bash

# Prompt
printf "Run pre-install script? (y/n)"
read RUN_SCRIPT

if [ $RUN_SCRIPT == "y" ]
then
    echo "Running pre-install script"

    # Install zsh
    echo "Installing zsh..."
    sudo apt install zsh

    # Install oh-my-zsh
    echo 'Installing oh-my-zsh'
    OMZDIR="$HOME/.oh-my-zsh"
    rm -rf  $OMZDIR
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    # Exit out of omz shell here
    # Remove defualt omz .zshrc
    rm -f $HOME/.zshrc
else
    echo "Not running pre-install script"
fi
