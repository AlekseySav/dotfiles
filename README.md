## my dotfiles

- `tmux` with `tpm` for plugins
- `nvim` with `lazy` for plugins and `mason` for lsp and dap

### setup
- clone repo: `git clone git@github.com:AlekseySav/dotfiles.git ~/.dotfiles`
- add bash config (`$HOME/.dotfiles/config/bash/profile.sh`) to profile
- run setup: `dots setup`

### prerequisites

- `nvim`, `ripgrep`, `fzf`, `tmux`, `zoxide` have to be installed
- if `brew` is found, it will be used to install them, so it is prefered
- only `bash` is supported

### code organization:
- `config/` &mdash; each config is linked to `~/.config/$name`
- `tools/` &mdash; small scripts, are accessed by `dots tool` command
- `dots.sh` &mdash; dotfiles manager, is linked to `/usr/local/bin/dots`

### dots
- `dots backup` &mdash; copy all managed dotfiles to `~/.dotfiles/.data/backup/`
- `dots install` &mdash; link all managed dotfiles to this repo
- `dots update` &mdash; fetch configs from remote repository
- `dots tool <cmd> [args...]` &mdash; run tool from `~/.dotfiles/tools/`
