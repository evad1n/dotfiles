RESET='\[\e[0m\]'

# TEXT EFFECTS
BOLD='\[\e[1m\]'
DIM='\[\e[2m\]'
UNDERLINE='\[\e[4m\]'
BLINK='\[\e[5m\]'
INVERT='\[\e[7m\]'
HIDDEN='\[\e[8m\]'

# COLORS
DEFAULT='\[\e[39m\]'

BLACK='\[\e[30m\]'
WHITE='\[\e[97m\]'
LIGHTGRAY='\[\e[37m\]'
DARKGRAY='\[\e[90m\]'

RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
MAGENTA='\[\e[35m\]'
CYAN='\[\e[36m\]'

LIGHTRED='\[\e[91m\]'
LIGHTGREEN='\[\e[92m\]'
LIGHTYELLOW='\[\e[93m\]'
LIGHTBLUE='\[\e[94m\]'
LIGHTMAGENTA='\[\e[95m\]'
LIGHTCYAN='\[\e[96m\]'


machine_name() {
    if [[ -f $HOME/.name ]]; then
        cat $HOME/.name
    else
        hostname
    fi
}

PROMPT_DIRTRIM=3
PS1="\n${BOLD}${GREEN}\\u@${GREEN}\$(machine_name)${DEFAULT}:${CYAN}\w${DEFAULT}\n\$(if [ \$? -ne 0 ]; then echo \"${RED}!${DEFAULT} \"; fi)${BLUE}>${DEFAULT} ${RESET}"