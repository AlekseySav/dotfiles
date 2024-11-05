#!/bin/bash

if [ ! -d $HOME/.dotfiles ]; then
	echo $HOME/.dotfiles not found >&2
	exit 1
fi
cd $HOME/.dotfiles

for config in $(ls config); do
	echo installing $config...
	mkdir .backup
	if [ -d $HOME/.config/$config ]; then
		mv $HOME/.config/$config .backup
	fi
	for file in $(cd config && find $config -type f); do
		mkdir -p $(dirname $HOME/.config/$file)
		if [ ! -f .backup/$file ] || [[ config/$file -nt .backup/$file ]]; then
			echo "$file"
			hooks/addvars.sh local.ini var.ini <config/$file >$HOME/.config/$file
		else
			ln .backup/$file $HOME/.config/$file
		fi
		chmod --reference=config/$file $HOME/.config/$file
	done
	if [ -f $HOME/.config/$config/update.sh ]; then
		echo running $config update
		$HOME/.config/$config/update.sh
	fi
	rm -rf .backup
done

if [ ! -f "$HOME/.zshrc" ] || ! grep 'source "$HOME/.config/zsh/profile.zsh"' <"$HOME/.zshrc"; then
	echo 'source "$HOME/.config/zsh/profile.zsh"' >>~/.zshrc
fi
