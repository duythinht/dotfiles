#!/bin/sh

case "$(uname)" in
	"Darwin")
		echo "Mac OS X"
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew install git mvim zsh tree
	;;
	"Linux")
		sudo apt-get update
		sudo apt-get install -y git zsh tree
	;;
esac

# Set up runtime config...
git clone https://github.com/duythinht/dotfiles.git ~/workspace/dotfiles
mkdir -p ~/workspace
cd ~/workspace/dotfiles

while read f; do
	echo "Copying file $f..."
	cp -rf $f ~/
done < Dotfiles
echo "Copy files done!"

# Install vim
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle
[ ! -d vundle ] && git clone https://github.com/gmarik/Vundle.vim.git vundle

# Change shell to zsh
chsh -s /bin/zsh
echo "Dotfiles has been installed!"
