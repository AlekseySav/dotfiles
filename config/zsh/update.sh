#!/bin/bash
ZINIT_HOME="$HOME/.local/share/zinit"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$ZINIT_HOME"
	git clone "https://github.com/zdharma-continuum/zinit.git" "$ZINIT_HOME"
else
	cd "$ZINIT_HOME"
	git pull
fi
