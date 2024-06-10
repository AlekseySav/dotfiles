## my dotfiles

### core tools

- `zsh` with `zinit`
- `tmux` with `tpm`
- `nvim` with `lazy.nvim` and `mason.nvim`

### dependencies

- `zsh`, `tmux`, `nvim`
- `fzf`, `zoxide`
- `ripgrep`

### setup
- clone repo: `git clone git@github.com:AlekseySav/dotfiles.git ~/.dotfiles`
- add bash config (`$HOME/.dotfiles/config/zsh/profile.zsh`) to profile
- run setup: `dots setup`

### code organization:
- `config/` &mdash; each config is linked to `~/.config/$name`
- `tools/` &mdash; small scripts, are accessed by `dots` command
- `bin/dots` &mdash; dotfiles manager
