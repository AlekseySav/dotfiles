# install dotfiles

# fetch repo
cd ~
if [ ! -d .dotfiles ]; then
	git clone git@github.com:AlekseySav/dotfiles.git .dotfiles
fi
cd .dotfiles

# install dots
cp ./dots /usr/local/bin/dots
