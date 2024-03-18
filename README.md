## my dot-files

### primary shell & package managers:
- `bash` &mdash; default shell
- `homebrew` &mdash; CLI tools package manager
- `mason.nvim` &mdash; lsp & dap package manager
- `lazy.nvim` &mdash; nvim package manager
- `tpm` &mdash; tmux package manager

### code organization:
- `config/` are linked to `~/.config/`
- `tools/` are accessed by `dot tool` command
- `dots` is stored at `/usr/local/bin`

### dots
- `dots backup` &mdash; copy all managed dotfiles to `~/.dotfiles/.data/backup/`
- `dots install` &mdash; link all managed dotfiles to this repo
- `dots info` &mdash; list all configs, all intsalled packages, etc.
- `dots save-info` &mdash; save info to `~/.dotfiles/info.yaml`
- `dots tool <cmd> [args...]` &mdash; run tool from `~/.dotfiles/tools/`

### setup

- install brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- install dots: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/AlekseySav/dotfiles/main/tools/dots-setup.sh)"`
- install core tools: `dots tool install-coretools`
- install configs: `dots install`
