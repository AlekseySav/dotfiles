# install dotfiles

# fetch repo
cd ~
if [ ! -d .dotfiles ]; then
	git clone git@github.com:AlekseySav/dotfiles.git .dotfiles
fi

cd .dotfiles
git pull

# install dots
rm -f /usr/local/bin/dots
ln -s "$HOME/.dotfiles/dots" /usr/local/bin/dots
