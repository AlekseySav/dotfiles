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

# create paths
mkdir -p $HOME/.local/state/dotfiles
mkdir -p $HOME/.local/bin

# fetch zinit
ZINIT_HOME="$HOME/.local/share/zinit"
fetch https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
source "$ZINIT_HOME/zinit.zsh"

# fetch tpm
fetch https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"

# source brew
evalfile /home/linuxbrew/.linuxbrew/bin/brew shellenv
evalfile /opt/homebrew/bin/brew shellenv

# link configs
linkconf alacritty
linkconf tmux
linkconf nvim
linkconf ohmyposh

# shell integration
if [[ $(command -v fzf) ]] && [[ $(fzf --help | grep zsh) ]]; then
	eval "$(fzf --zsh)"
fi
if [[ $(command -v zoxide) ]]; then
	eval "$(zoxide init --cmd cd zsh)"
fi
if [[ $(command -v oh-my-posh) ]]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
fi

# link dots tool
PATH="$PATH:$HOME/.dotfiles/tools/bin/"
