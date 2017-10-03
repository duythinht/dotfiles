#!/bin/sh
# Set up runtime config...
git clone https://github.com/duythinht/dotfiles.git ~/workspace/dotfiles
mkdir -p ~/workspace
cd ~/workspace/dotfiles

while read f; do
	echo "Copying file $f..."
	cp -rf $f ~/
done < Dotfiles
echo "Copy files done!"

# Install vim plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
