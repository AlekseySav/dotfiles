# usage:
#	dots tool notes edit

if [[ $1 == edit ]]; then
	mkdir -p "$HOME/Documents/notes"
	cd "$HOME/Documents/notes"
	nvim index.md
fi
