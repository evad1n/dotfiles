# For editing aliases quickly
alias realias='vim ~/.bash_aliases; source ~/.bash_aliases'

alias ll='ls -l'
alias la='ls -Al'

alias gh='history|grep'


alias desktop='cd /mnt/c/Users/willd/Desktop'
alias rust='code /mnt/c/Users/willd/Desktop/testing/rust'

# Functions (basically more powerful aliases)

browser() { cmd.exe /c start "$@"; } 
mkcd() { mkdir -p "$@" && cd "$@"; }

# Git add all changes and commit 
gcma() { git add -A; git commit -m "$@"; }

# Python venv
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
