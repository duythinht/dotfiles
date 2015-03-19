#!/bin/sh
#sudo apt-get install -y git vim-gtk zsh

case "$(uname)" in
	"Darwin")
		echo "Mac OS X"
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew install git mvim zsh tree
	;;
	"Linux")
		sudo add-apt-repository -y ppa:numix/ppa
		sudo apt-get update
		sudo apt-get install -y git vim-gtk zsh tree
		sudo apt-get install numix-gtk-theme numix-icon-theme
	;;
esac

# Set up runtime config...
cd ~/
git clone https://github.com/duythinht/one_click_setup.git
cd ~/one_click_setup
cp -rf .vimrc ~/
cp -rf .tmux.conf ~/
cp -rf .zshrc ~/
cp -rf .cmd_alias ~/
cp -rf .zlogin ~/
mkdir -p ~/.themes
cp -rf iris-light ~/.themes
if type gconftool-2; then gconftool-2 --load gnome-terminal-conf.xml; fi

# Install vim
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git vundle

# Change shell to zsh
chsh -s /bin/zsh

echo """
Run this command to import terminal color scheme
gconftool-2 --load gnome-terminal-conf.xml
"""
