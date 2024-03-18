# install dotfiles

# install core utils
# brew install coreutils
# brew install fzf
# brew install jq
# brew install ripgrep
# brew install tree

# install dev tools
# brew install neovim
# brew install tmux
# brew install zoxide

# install languages
# brew install rust
# brew install zig

# fetch repo
cd ~
if [ ! -d .dotfiles ]; then
	git clone git@github.com:AlekseySav/dotfiles.git .dotfiles
fi
cd .dotfiles

# install dots
cp ./dots /usr/local/bin/dots
