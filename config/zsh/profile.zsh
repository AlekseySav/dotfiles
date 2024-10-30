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
