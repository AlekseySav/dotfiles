# install dotfiles

cd $HOME/.dotfiles

rm -rf config/tmux/plugins/tpm
rm -rf .data/sources .data/bin

mkdir -p .data/configs .data/cache .data/backups .data/sources .data/bin/dir

ln -s dots.sh .data/bin/dots

# install dependencies

git clone https://github.com/tmux-plugins/tpm.git config/tmux/plugins/tpm

if command -v brew &> /dev/null; then
	brew install zoxide fzf ripgrep neovim tmux
	ln -s $(brew --prefix)/rg .data/bin/rg
	exit
fi

echo -n >.data/configs/setup_config
echo "https://github.com/ajeetdsouza/zoxide/releases: " >>.data/configs/setup_config
echo "https://github.com/junegunn/fzf/releases: " >>.data/configs/setup_config
echo "https://github.com/BurntSushi/ripgrep/releases: " >>.data/configs/setup_config
echo "https://github.com/tmux/tmux/releases: " >>.data/configs/setup_config
echo "https://github.com/neovim/neovim/releases: " >>.data/configs/setup_config
vim .data/configs/setup_config

while read line; do
	name=$(echo $line | cut -d' ' -f1 | rev | cut -d'/' -f2 | rev)
	link=$(echo $line | cut -d' ' -f2)
	echo $name $link
	if [[ $(echo $line | cut -d' ' -f1) == $link ]]; then
		echo "bad link" >&2
		exit 1
	fi
	rm -rf .data/bin/dir/$name
	mkdir .data/bin/dir/$name
	curl -sLJO $line >.data/sources/$name.tar.gz
	tar xfz .data/sources/$name.tar.gz -C .data/bin/dir/$name
	if [[ $name == "tmux" ]]; then
		(cd .data/bin/dir/tmux/*; ./configure --enable-utf8proc >/dev/null && make --silent)
	fi
done <<<"$(cat .data/configs/setup_config)"

ln -s .data/bin/zoxide_dir/zoxide .data/bin/zoxide
ln -s .data/bin/dir/fzf/fzf .data/bin/fzf
ln -s .data/bin/dir/ripgrep/*/rg .data/bin/rg
ln -s .data/bin/dir/neovim/*/bin/nvim .data/bin/nvim
ln -s .data/bin/dir/tmux/*/tmux .data/bin/tmux
