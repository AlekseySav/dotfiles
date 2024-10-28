fetch() {
	if [ ! -d "$2" ]; then
		mkdir -p "$2"
		git clone "$1" "$2"
	fi
}

evalfile() {
	if [ -f $1 ]; then
		eval "$($@)"
	fi
}

if [ -f ${brew.path} ]; then
	eval "$(${brew.path} shellenv)"
fi

# fetch zinit
ZINIT_HOME="$HOME/.local/share/zinit"
fetch https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
source "$ZINIT_HOME/zinit.zsh"

# fetch tpm
fetch https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"

# link dots tool
PATH="$PATH:$HOME/.dotfiles/tools/bin/"
