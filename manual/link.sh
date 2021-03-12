#!/bin/bash

# Link to local files
# Bash
echo "source $HOME/.bash/include.bash" >> $HOME/.bashrc
# Zsh
echo "source $HOME/.zsh/include.zsh" >> $HOME/.zshrc

# Create local aliases file
touch $HOME/.aliases-local.zsh
