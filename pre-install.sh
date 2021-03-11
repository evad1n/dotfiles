# Check if zsh is installed,
if ! [ -x "$(command -v zsh)" &> /dev/null ]
then
	echo "zsh not installed. Installing...."
	sudo apt install zsh
	# Remove default zshrc
	rm $HOME/.zshrc
	touch $HOME/.zshrc
else
	echo "zsh already installed"
fi

# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ] 
then
	echo 'Installing oh-my-zsh'
	/bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	echo 'oh-my-zsh already installed'
fi

# OMZ already does this automatically so kkk
# # Change default shell to zsh
# if [ ! $SHELL = "/usr/bin/zsh" ] 
# then
# 	echo 'Changing default shell to zsh'
# 	chsh -s $(which zsh)
# else
# 	echo 'Already using zsh'
# fi