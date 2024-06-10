fetch() {
	if [ ! -d "$2" ]; then
		mkdir -p "$2"
		git clone "$1" "$2"
	fi
}

# install zsh
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
fetch https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
source "$ZINIT_HOME/zinit.zsh"

# install tpm
fetch https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"

# source brew
BREW_HOME="/home/linuxbrew/.linuxbrew/bin/brew"
if [ -f $BREW_HOME ]; then
	eval "$($BREW_HOME shellenv)"
fi
