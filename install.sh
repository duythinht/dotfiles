#!/bin/sh

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
[ -d dotfiles ] && rm -rf dotfiles
git clone https://github.com/duythinht/dotfiles.git
cd ~/dotfiles

while read f; do
	echo "Copying file $f..."
	cp -rf $f ~/
done < Dotfiles
echo "Copy files done!"

mkdir -p ~/.themes
cp -rf iris-light ~/.themes

# Install vim
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle
[ ! -d vundle ] && git clone https://github.com/gmarik/Vundle.vim.git vundle

# Change shell to zsh
chsh -s /bin/zsh
echo "Dotfiles has been installed!"
