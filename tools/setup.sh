# setup dotfiles

cd $HOME/.dotfiles
configs="$(ls config)"

echo "clear old setup (if any)..."
rm -rf config/tmux/plugins/tpm
rm -rf .data

echo "make directories and links"
mkdir -p .data/configs .data/cache .data/backup/config .data/sources .data/bin-dir .data/bin
ln -s $HOME/.dotfiles/dots.sh .data/bin/dots

for config in $configs; do
	echo "backup $config..."
	cp -r "$HOME/.config/$config" ".data/backup/config/$config"
done

for config in $configs; do
	rm -rf "$HOME/.config/$config"
	ln -s "$HOME/.dotfiles/config/$config" "$HOME/.config/$config"
	echo linking $config... >&2
done

echo "installing dependencies"

git clone https://github.com/tmux-plugins/tpm.git config/tmux/plugins/tpm

if command -v brew &> /dev/null; then
	brew install zoxide fzf ripgrep neovim tmux
	ln -s $(brew --prefix)/bin/rg .data/bin/rg
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
	rm -rf .data/bin-dir/$name
	mkdir .data/bin-dir/$name
	curl -sLJO $line >.data/sources/$name.tar.gz
	tar xfz .data/sources/$name.tar.gz -C .data/bin-dir/$name
	if [[ $name == "tmux" ]]; then
		(cd .data/bin-dir/tmux/*; ./configure --enable-utf8proc >/dev/null && make --silent)
	fi
done <<<"$(cat .data/configs/setup_config)"

ln -s .data/bin-dir/zoxide/zoxide .data/bin/zoxide
ln -s .data/bin-dir/fzf/fzf .data/bin/fzf
ln -s .data/bin-dir/ripgrep/*/rg .data/bin/rg
ln -s .data/bin-dir/neovim/*/bin/nvim .data/bin/nvim
ln -s .data/bin-dir/tmux/*/tmux .data/bin/tmux