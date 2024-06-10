# zshell config
source $HOME/.dotfiles/config/zsh/fetch_deps.sh

# zsh plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# completion
autoload -U compinit && compinit
zstyle ':completion:*' menu no

# key bindings
bindkey -e
bindkey '^ ' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# aliases
alias ls='ls --color'
alias nv=nvim
alias la="ls -a --color=auto"

# shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# history
HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
