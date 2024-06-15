# usage:
#	dots tool cht -- find and open cheatshhet
#			q to exit
#			<C-c> to retry

cht_path="$HOME/.local/state/dotfiles/chtsh"

show() {
	cat "$cht_path" | less -K -r
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
	curl -s cht.sh/$topic/$question >"$cht_path"
	show
	if [ $? -ne 0 ]; then
		run
	fi
}

options=$(curl -s cht.sh/:list)
topics=$(echo "$options" | cut -d'/' -f1)
topic=$(choose "$topics")
if [ $? -ne 0 ]; then
	exit
fi
run
