## my dotfiles

- `zsh` with `zinit` for plugins
- `tmux` with `tpm` for plugins
- `nvim` with `lazy` for plugins and `mason` for lsp and dap

### setup
- clone repo: `git clone git@github.com:AlekseySav/dotfiles.git ~/.dotfiles`
- add bash config (`$HOME/.dotfiles/config/zsh/profile.zsh`) to profile
- run setup: `dots setup`

### prerequisites

- `zsh`, `nvim`, `ripgrep`, `fzf`, `tmux`, `zoxide` have to be installed
- if `brew` is found, it will be used to install them, so it is prefered

### code organization:
- `config/` &mdash; each config is linked to `~/.config/$name`
- `tools/` &mdash; small scripts, are accessed by `dots` command
- `bin/dots` &mdash; dotfiles manager
