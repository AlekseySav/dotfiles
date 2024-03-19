#!/usr/bin/env bash

# setup prompt
if [[ $(uname) == Darwin ]]; then
	PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ "
fi

# setup dots
PATH="$HOME/.dotfiles/bin:$PATH"

# setup zoxide
eval "$(zoxide init --cmd cd bash)"

# setup aliases
alias nv=nvim

if [[ $(uname) == Darwin ]]; then
	alias hh="history | fzf --tac | pbcopy"
else
	alias hh="history | fzf --tac | xclip -cel"
fi
