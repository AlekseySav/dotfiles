# usage:
#	dots tool cht s -- open last cheatsheet
#	dots tool cht -- find and open cheatshhet
#			q to exit
#			<C-c> to retry

show() {
	cat "$HOME/.dotfiles/.data/cache/chtsh" | less -K -r
	return $?
}

choose() {
	res=$(echo "$1" | grep -v "^:" | sort | uniq | fzf --tac)
	if [[ -z "$res" ]]; then
		echo "not chosen" >&2
		exit 1
	fi
	echo "$res"
}

run() {
	echo $topic
	echo -n "question: "
	read question
	question=$(echo "$question" | tr ' ' '+')

	mkdir -p "$HOME/.dotfiles/.data/cache"
	curl -s cht.sh/$topic/$question >"$HOME/.dotfiles/.data/cache/chtsh"
	show
	if [ $? -ne 0 ]; then
		run
	fi
}

if [[ $1 == "s" ]]; then
	show
	exit
fi

options=$(curl -s cht.sh/:list)
topics=$(echo "$options" | cut -d'/' -f1)
topic=$(choose "$topics")
if [ $? -ne 0 ]; then
	exit
fi

run
