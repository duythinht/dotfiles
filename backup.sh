#!/bin/sh

while read f; do
	echo "Backup file $f..."
	cp -rf ~/$f ./
done < Dotfiles
echo "Backup files done, please commit!"

git add . -A
git commit -m "Backup at $(date)"
git push origin master
