new -A -s dotfiles
neww -n dotfiles -c "$HOME/.dotfiles/"
neww -n dotfiles -c "$HOME/.dotfiles/" nvim .

swapw -s 0 -t 2
killw -t 2
selectw -t 0
