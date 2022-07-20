# For editing aliases quickly
alias etal='$EDITOR $HOME/.bash/aliases.bash'
alias etall='$EDITOR $HOME/.aliases-local.bash'
alias catal='cat $HOME/.bash/aliases.bash'
alias catall='cat $HOME/.aliases-local.bash'
alias sc='source $HOME/.bashrc'

alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -Al'

# Grep
alias gh="history | grep -i"

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

# Allow local customizations in the ~/.aliases-local.bash file
if [ -f ~/.aliases-local.bash ]; then
    source ~/.aliases-local.bash
fi