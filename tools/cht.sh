#!/usr/bin/env bash

show() {
	cat "$HOME/.dotfiles/.data/cache/chtsh" | less -r
}

choose() {
	res=$(echo "$1" | grep -v "^:" | uniq | fzf --tac)
	if [[ -z "$res" ]]; then
		echo "not chosen" >&2
		exit 1
	fi
	echo "$res"
}

if [[ $1 == "s" ]]; then
	show
	exit
fi

options=$(curl cht.sh/:list 2>/dev/null)
topics=$(echo "$options" | cut -d'/' -f1)

topic=$(choose "$topics")
if [ $? -ne 0 ]; then
	exit
fi

subs=$(echo "$options" | grep "^$topic/" | cut -d'/' -f2)

if [[ "$subs" != "" ]]; then
	sub=$(choose "$subs")
	if [ $? -ne 0 ]; then
		exit
	fi
	topic="$topic/$sub"
fi

mkdir -p "$HOME/.dotfiles/.data/cache"
curl cht.sh/$topic 2>/dev/null >"$HOME/.dotfiles/.data/cache/chtsh"
show
