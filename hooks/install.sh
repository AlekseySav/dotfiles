#!/bin/bash

if [ ! -d $HOME/.dotfiles ]; then
	echo $HOME/.dotfiles not found >&2
	exit 1
fi
cd $HOME/.dotfiles

for config in $(ls config); do
	echo installing $config...
	if [ -d $HOME/.config/$config ]; then
		if [[ config/$config -nt $HOME/.config/$config ]]; then
			rm -rf $HOME/.config/$config
		else
			echo up to date
			continue
		fi
	fi
	for file in $(cd config && find $config -type f); do
		echo $file
		mkdir -p $(dirname $HOME/.config/$file)
		hooks/addvars.sh local.ini var.ini <config/$file >$HOME/.config/$file
		chmod --reference=config/$file $HOME/.config/$file
	done
	if [ -f $HOME/.config/$config/update.sh ]; then
		echo running $config update
		$HOME/.config/$config/update.sh
	fi
done

if [ ! -f '$HOME/.zshrc' ] || ! grep 'source "$HOME/.config/zsh/profile.zsh"' <~/.zshrc; then
	echo 'source "$HOME/.config/zsh/profile.zsh"' >>~/.zshrc
fi
