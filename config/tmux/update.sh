#!/bin/bash
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	mkdir -p "$HOME/.tmux/plugins/tpm"
	git clone https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"
else
	cd "$HOME/.tmux/plugins/tpm"
	git pull
fi
