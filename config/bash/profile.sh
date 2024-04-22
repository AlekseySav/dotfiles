#!/usr/bin/env bash

# setup completion
if [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
fi

# setup prompt
if [[ $(uname) == Darwin ]]; then
	PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ "
fi

# setup dots
PATH="$HOME/.dotfiles/bin:$HOME/.dotfiles/.data/bin:$PATH"

# setup zoxide
eval "$(zoxide init --cmd cd bash)"

# setup fzf
eval "$(fzf --bash)"

# setup aliases
alias nv=nvim
alias ls="ls --color=auto"
alias la="ls -a --color=auto"

if [[ $(uname) == Darwin ]]; then
	alias hh="history | fzf --tac | pbcopy"
else
	alias hh="history | fzf --tac | xclip -cel"
fi
