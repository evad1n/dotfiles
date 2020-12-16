# For editing aliases quickly
alias realias='vim ~/.bash_aliases; source ~/.bash_aliases'

alias ll='ls -l'
alias la='ls -Al'

alias gh='history|grep'


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
