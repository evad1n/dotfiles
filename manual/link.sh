#!/bin/bash

# Link to local files

BASH_INCLUDE_PATH=$HOME/.bash/include.bash
ZSH_INCLUDE_PATH=$HOME/.zsh/include.zsh

# Bash
echo "Added line 'source $BASH_INCLUDE_PATH' to $HOME/.bashrc"
echo "source $BASH_INCLUDE_PATH" >> $HOME/.bashrc

# Zsh
echo "Added line 'source $ZSH_INCLUDE_PATH' to $HOME/.zshrc"
echo "source $ZSH_INCLUDE_PATH" >> $HOME/.zshrc

# Create local aliases files
echo "Creating local aliases file @ $HOME/.aliases-local.bash"
touch $HOME/.aliases-local.bash

echo "Creating local aliases file @ $HOME/.aliases-local.zsh"
touch $HOME/.aliases-local.zsh

# Link gitconfig_base
echo "\n[include]
	path = ~/.gitconfig_base\n" >> ~/.gitconfig   
