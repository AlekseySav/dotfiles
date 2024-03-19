## my dotfiles

### primary shell & package managers:
- `bash` &mdash; default shell
- `homebrew` &mdash; package manager for CLI tools
- `mason.nvim` &mdash; package manager for lsp & dap
- `lazy.nvim` &mdash; package manager for nvim plugins
- `tpm` &mdash; package manager for tmux

### code organization:
- `.data/` &mdash; for backups, cache, etc.
- `config/` &mdash; each config is linked to `~/.config/$name`
- `tools/` &mdash; small scripts, are accessed by `dots tool` command
- `dots` &mdash; dotfiles manager, is linked to `/usr/local/bin/dots`

### dots
- `dots backup` &mdash; copy all managed dotfiles to `~/.dotfiles/.data/backup/`
- `dots install` &mdash; link all managed dotfiles to this repo
- `dots update` &mdash; fetch configs from remote repository
- `dots info` &mdash; list all configs, all intsalled packages, etc.
- `dots save-info` &mdash; save info to `~/.dotfiles/info.yaml`
- `dots tool <cmd> [args...]` &mdash; run tool from `~/.dotfiles/tools/`

### setup
- install brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- clone dots: `git clone git@github.com:AlekseySav/dotfiles.git ~/.dotfiles`
- add bash config .profile: `source ~/.dotfiles/config/bash/profile.sh`
- setup dots: `dots setup`
- install core tools: `dots tool install-coretools`
