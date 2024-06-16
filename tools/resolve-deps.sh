# check all dependencies

check() {
	if [[ $(command -v $1) ]]; then
		echo "$1 found"
	else
		if [[ $2 == optional ]]; then
			echo "$1 not found (optional)"
		else
			echo "$1 not found"
		fi
	fi
}

checkargs() {
	if [[ $(command -v $1) ]]; then
		if [[ $($1 --help | grep '$2') ]]; then
			echo "$1 not $3"
		else
			echo "$1 $3"
		fi
	fi
}

check zsh
check nvim
check tmux
check fzf
checkargs fzf --zsh "integratable with zsh"
check zoxide
check rg
check oh-my-posh
check brew optional
check alacritty optional
