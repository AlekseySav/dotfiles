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

- `git clone git@github.com:AlekseySav/dotfiles.git ~/.dotfiles`
- install font from `assets/...`
- `echo "$HOME/.dotfiles/config/zsh/profile.zsh" >>.zshrc`

### code organization:
- `config/` &mdash; each config is linked to `~/.config/$name`
- `tools/` &mdash; small scripts, are accessed by `dots` command
- `bin/dots` &mdash; dotfiles runner
