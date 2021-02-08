# For editing aliases quickly
alias realias='vim ~/.bash_aliases; source ~/.bash_aliases'

alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -Al'

# Grep
alias gh="history|grep"


# Functions (basically more powerful aliases)

mkcd() { mkdir -p "$@" && cd "$@"; }

# Git add all changes and commit
# alias gcAm="git add -A; git commit -m"
gcAm() {
    if [ $# -eq 0 ]; then
        echo "Please specify a commit message"
        return
    fi
    git add -A; git commit -m "$@";
}

# Python venv
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'


# Allow local customizations in the ~/.bash_aliases_local file
if [ -f ~/.bash_aliases_local ]; then
    source ~/.bash_aliases_local
fi