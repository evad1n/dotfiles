# Editing aliases
alias etal="$EDITOR $ZSH_CUSTOM/aliases.zsh"
alias scal="source $ZSH_CUSTOM/aliases.zsh"

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

alias install="sudo apt install"

###############################################
# Functions (basically more powerful aliases)
###############################################

mkcd() { mkdir -p "$@" && cd "$@"; }

# p10k colors
p10kcolors() { for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done }



# Allow local customizations in the .aliases-local.zsh file
if [ -f "$ZSH_CUSTOM/aliases-local.zsh" ]; then
    source "$ZSH_CUSTOM/aliases-local.zsh"
fi
