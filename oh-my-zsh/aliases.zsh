# Editing aliases
alias etal="$EDITOR $ZSH_CUSTOM/aliases.zsh"
alias scal="source $ZSH_CUSTOM/aliases.zsh"

# Grep
alias gh="history|grep"
alias -g G="| grep"

# Python venv
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

# Overwriting
alias mkdir="mkdir -p"

# Functions (basically more powerful aliases)
mkcd() { mkdir -p "$@" && cd "$@"; }
