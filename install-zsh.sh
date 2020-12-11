# Install zsh
sudo apt install zsh
# Change default shell
chsh -s $(which zsh)

# Powerline fonts
sudo apt-get install fonts-powerline

# Install oh my zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
ZSH="$HOME/.dotfiles/oh-my-zsh" sh install.sh --unattended

# Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# fonts
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

# ZSH syntaxx highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Must log out and back in again to take effect (Actually sign out, not just a new terminal)