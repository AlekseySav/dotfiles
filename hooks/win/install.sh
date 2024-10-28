#!/bin/bash
DOTS=$HOME/.dotfiles
path=$(wslpath $1)

if [ ! -d $path ]; then
	echo $path
	echo "usage: install.sh <path to mounted win fs>" >&2
	exit 1
fi

p() {
	$DOTS/hooks/addvars.sh $DOTS/local.ini $DOTS/var.ini <$1
}

# setup scripts/wsl.bat
mkdir -p $path/scripts
p $DOTS/hooks/win/wsl.bat | sed 's/$/\r/' >$path/scripts/wsl.bat

# setup alacritty
ALACRITTY=$path/AppData/Roaming/alacritty
IPATH="$1\\AppData\\Roaming\\alacritty"
mkdir -p "$ALACRITTY"
echo "import = [">$ALACRITTY/alacritty.toml

imports=$(p $DOTS/config/alacritty/alacritty.toml | yj -ty | yq -oc '.import')
for file in "$imports"; do
	eval file=$file
	mkdir -p $(dirname "$ALACRITTY$file")
	p $file | sed 's/$/\r/' >"$ALACRITTY$file"
	ipath=$(sed 's/[/\\]/\\\\/g' <<<"$IPATH$file")
	echo "  \"$ipath\",">>$ALACRITTY/alacritty.toml
done
echo "]">>$ALACRITTY/alacritty.toml
echo "[shell]">>$ALACRITTY/alacritty.toml
echo "program = \"$1\\scripts\\alacritty.bat\"" | sed 's/[\\]/\\\\/g' >>$ALACRITTY/alacritty.toml
p $DOTS/config/alacritty/alacritty.toml | yj -ty | yq 'del(.import)' | yj -yt >>$ALACRITTY/alacritty.toml
sed -i 's/$/\r/' $ALACRITTY/alacritty.toml
