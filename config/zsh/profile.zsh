# zshell config

# init brew
if [ -f ${brew.path} ]; then
	eval "$(${brew.path} shellenv)"
fi

# init all tools
for config in $(ls $HOME/.config); do
	if [[ $(command -v $config) ]] && [ -f $HOME/.config/$config/init.sh ]; then
		source $HOME/.config/$config/init.sh
	fi
done
