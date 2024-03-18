# install dotfiles

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install core utils
brew install coreutils
brew install fzf
brew install jq
brew install ripgrep
brew install tree

# install dev tools
brew install neovim
brew install tmux
brew install zoxide

# install languages
brew install rust
brew install zig

# fetch repo
cd ~
git clone git@github.com:AlekseySav/dotfiles.git .dotfiles
cd .dotfiles

# install dots
./dots install
