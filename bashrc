# Include and source all desired bash files
source ~/.bash/standard.bash
source ~/.bash/prompt.bash
source ~/.bash/aliases.bash

# Allow local customizations
if [ -f "$HOME/.bashrc-local" ]; then
    source "$HOME/.bashrc-local"
fi
# added by travis gem
[ ! -s /home/evadin/.travis/travis.sh ] || source /home/evadin/.travis/travis.sh
