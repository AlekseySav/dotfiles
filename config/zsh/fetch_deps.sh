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

linkconf() {
	if [ ! -e "$HOME/.config/$1" ]; then
		echo "Linking $1 config"
		ln -s "$HOME/.dotfiles/config/$1" "$HOME/.config/$1"
	fi
}

# install zsh
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
fetch https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
source "$ZINIT_HOME/zinit.zsh"

# install tpm
fetch https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"

# source brew
evalfile /home/linuxbrew/.linuxbrew/bin/brew shellenv
evalfile /opt/homebrew/bin/brew shellenv

# link configs
linkconf alacritty
linkconf tmux
linkconf nvim

# link dots tool
PATH="$PATH:$HOME/.dotfiles/bin/"
