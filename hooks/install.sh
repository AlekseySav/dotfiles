#!/bin/bash

if [ ! -d $HOME/.dotfiles ]; then
	echo $HOME/.dotfiles not found >&2
	exit 1
fi
cd $HOME/.dotfiles

for config in $(ls config); do
	echo copying $config...
	if [ -d $HOME/.config/$config ]; then
		rm -rf $HOME/.config/$config
	fi
	for file in $(cd config && find $config -type f); do
		echo $file
		mkdir -p $(dirname $HOME/.config/$file)
		hooks/addvars.sh local.ini var.ini <config/$file >$HOME/.config/$file
	done
done

if [ ! -f '$HOME/.zshrc' ] || ! grep 'source "$HOME/.config/zsh/profile.zsh"' <~/.zshrc; then
	echo 'source "$HOME/.config/zsh/profile.zsh"' >>~/.zshrc
fi
