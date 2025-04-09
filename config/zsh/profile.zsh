# link submodules
for f in ${repos}; do
	dest="$HOME/$(PATH="$PATH:$(readlink -m ${zsh.path}/..)" "$HOME/.dotfiles/hooks/copy_to_config" --resolve "repos.$f")"
	if [ ! -d "$dest" ]; then
		echo linking "$f"...
		mkdir -p $(dirname "$dest")
		ln -s "$HOME/.dotfiles/submodules/$f" "$dest"
	fi
done

# init brew
if [ -f ${brew.path} ]; then
	eval "$(${brew.path} shellenv)"
fi

# init all tools
for config in ${general.configs}; do
	if [ -f $HOME/.config/$config/init.zsh ]; then
		source $HOME/.config/$config/init.zsh
	fi
done
