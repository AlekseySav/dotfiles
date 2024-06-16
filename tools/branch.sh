# print current branch

run() {
	out=$($1 branch 2>/dev/null | grep '*' | cut -d' ' -f2)
	if [[ ! -z "$out" ]]; then
		echo $out
	fi
}

run git
run arc
