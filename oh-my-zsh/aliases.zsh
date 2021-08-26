# Editing aliases
alias etal="$EDITOR $ZSH_CUSTOM/aliases.zsh"
alias etall="$EDITOR $HOME/.aliases-local.zsh"
alias scal="source $HOME/.aliases-local.zsh $ZSH_CUSTOM/aliases.zsh"

# Ls
alias l="ls -lh"
alias ll="ls -lah"

# Grep
alias gh="history|grep"
alias -g G="| grep"

# Python venv
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

# Other
alias mkdir="mkdir -p"

# gcam exists for lower -a
alias gcAm="gaa; gcmsg"

# Delete local untracked/deleted branches
alias git-remove-untracked='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -d'

alias install="sudo apt install"
alias open="xdg-open"

###############################################
# Functions (basically more powerful aliases)
###############################################

mkcd() { mkdir -p $1 && cd $1; }

# p10k colors
p10kcolors() { 
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done 
}

git_rm_submodule() {
    echo "removing submodule $1..."
    git submodule deinit $1
    rm -rf .git/modules/$1
    git rm -f $1
    rm -rf $1
}


# Allow local customizations in the .aliases-local.zsh file
if [ -f "$HOME/.aliases-local.zsh" ]; then
    source "$HOME/.aliases-local.zsh"
fi
