# Editing aliases
alias etal="$EDITOR $ZSH_CUSTOM/aliases.zsh"
alias etall="$EDITOR $HOME/.aliases-local.zsh"
alias catal="cat $ZSH_CUSTOM/aliases.zsh"
alias catall="cat $HOME/.aliases-local.zsh"
alias sc="source $HOME/.zshrc"

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
alias gbat="git for-each-ref --sort='-committerdate:iso8601' --format='%(committerdate:relative)|%(refname:short)|%(committername)' refs/ | column -s '|' -t"
alias gsus="git submodule status"

# System shortcuts
alias install="sudo apt install"
alias open="xdg-open"
# Show disk usage for ext4 fs type
alias space="df -h -t ext4"

# Docker
alias dl="docker ps"

###############################################
# Functions (basically more powerful aliases)
###############################################

# $1 - dir name
mkcd() { mkdir -p $1 && cd $1; }

# p10k colors
p10kcolors() { 
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done 
}

# Delete local untracked/deleted branches
git_remove_untracked() {
    git fetch --prune
    git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -d
}

# $1 - submodule name
git_rm_submodule() {
    echo "removing submodule $1..."
    git submodule deinit $1
    rm -rf .git/modules/$1
    git rm -f $1
    rm -rf $1
}

git_rename_master_main() {
    git branch -m master main
    git fetch origin
    git branch -u origin/main main
    git remote set-head origin -a
}

# Show image size
# $1 - image name
image_size() {
	docker inspect $1 --format='{{.Size}}' | numfmt --to=si
}

# Show biggest files
# $1 - search directory
# $2 - num files to show (default 20)
bigf() {
    num=${2:-20}
    find $1 -type f -exec du -ah {} + | sort -hr | head -n $num
}

# Show biggest directories and files
# $1 - search directory
# $2 - num files to show (default 20)
bigd() {
    num=${2:-20}
    du -ah $1 | sort -hr | head -n $num
}

# Allow local customizations in the .aliases-local.zsh file
if [ -f "$HOME/.aliases-local.zsh" ]; then
    source "$HOME/.aliases-local.zsh"
fi
