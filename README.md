## my dotfiles

### core tools & plugin managers

- `zsh` with `zinit`
- `tmux` with `tpm`
- `nvim` with `lazy.nvim` and `mason.nvim`

### setup

- `git clone --recurse-submodules git@github.com:AlekseySav/dotfiles.git ~/.dotfiles`
- `~/.dotfiles/hooks/copy-to-config --all --prune-old`
- `echo 'source "$HOME/.config/zsh/profile.zsh"' >>~/.zshrc`

#### for alacritty:

- install font from `submodules/ComicMonoNF`
