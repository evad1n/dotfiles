# Short-circuits to false when not on Darwin OS
DARWIN=false && [[ $(uname) == "Darwin" ]] && DARWIN=true
# OS specific
if $DARWIN
then
    alias install="brew install"
else
    alias install="sudo apt install"
    alias open="xdg-open"

    # Uses network manager
    get_dns() {
        local CONN=$(nmcli -t --fields NAME con show --active | head -n 1)
        nmcli --fields ipv4.dns,ipv6.dns con show "$CONN"
    }
fi

# Editing aliases
alias etal="$EDITOR $ZSH_CUSTOM/aliases.zsh"
alias etall="$EDITOR $HOME/.aliases-local.zsh"
alias catal="cat $ZSH_CUSTOM/aliases.zsh"
alias catall="cat $HOME/.aliases-local.zsh"
alias sc="source $HOME/.zshrc"

# ls
alias l="ls -lh"
alias ll="ls -lah"

# grep
alias gh="history | grep -i"
alias -g G="| grep"
alias fng="list_functions | grep -i"

# git
# git submodule update --recursive
alias gsur="gsu --recursive"
# gcam exists for lower -a
alias gcAm="gaa; gcmsg"
alias gbat="git for-each-ref --sort='-committerdate:iso8601' --format='%(committerdate:relative)|%(refname:short)|%(committername)' refs/ | column -s '|' -t"
alias gsus="git submodule status"

# Other
alias mkdir="mkdir -p"

# Show disk usage for ext4 fs type
alias space="df -h -t ext4"

# Listening ports
alias ports="lsof -i -P -n | grep LISTEN"

# Docker
alias dc="docker compose"
alias dl="docker ps"
alias dn="docker network"

alias git_code="GIT_EDITOR='code -w' git"

alias p="pnpm"

###############################################
# Functions (basically more powerful aliases)
###############################################

# Print all defined functions that don't begin with underscore
# Use 'which' to see the definition
list_functions() {
    print -l ${(ok)functions[(I)[^_]*]}
}

# $1 - dir name
mkcd() {
    mkdir -p $1 && cd $1
}

# terminal colors
list_colors() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# GIT

# Delete local untracked/deleted branches
# $1 - git branch {}
git_rm_untracked() {
    local DELETE=${1:--d}
    git fetch --all --prune --jobs=10
    git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch $DELETE
}

# $1 - submodule name
git_rm_submodule() {
    echo "removing submodule $1..."
    git submodule deinit $1
    rm -rf .git/modules/$1
    git rm -f $1
    rm -rf $1
}

git_rename_master_to_main() {
    git branch -m master main
    git fetch origin
    git branch -u origin/main main
    git remote set-head origin -a
}

git_overwrite_tag() {
    echo tag $1
    git tag -f $1 && gp origin -d $1 && gp origin $1
}

# DOCKER

# Show image size
# $1 - image name
image_size() {
	docker inspect $1 --format='{{.Size}}' | numfmt --to=si
}

# Remove containers by name pattern
# $1 - name pattern
drm_name() {
    docker rm -f $(docker ps -q --filter name=$1)
}

# Kill and remove all docker containers
dkill() {
    docker rm -f $(docker ps -qa)
}

# OTHER

# Show biggest files
# $1 - search directory
# $2 - num files to show (default 20)
bigf() {
    local NUM=${2:-20}
    find $1 -type f -exec du -ah {} + | sort -hr | head -n $NUM
}

# Show biggest directories and files
# $1 - search directory
# $2 - num files to show (default 20)
bigd() {
    local NUM=${2:-20}
    du -ah $1 | sort -hr | head -n $NUM
}

# Print SSL info
# $1 - website domain
get_ssl_cert() {
    openssl s_client -connect $1:443 </dev/null 2>/dev/null | openssl x509 -inform pem -text
}

# Allow local customizations in the .aliases-local.zsh file
if [ -f "$HOME/.aliases-local.zsh" ]; then
    source "$HOME/.aliases-local.zsh"
fi