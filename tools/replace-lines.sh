# replace lines with pattern
# usage: cat ... | dots tool replace-lines [-f] "// %s"

force=""

if [[ $1 == "-f" ]]; then
	force="1"
	shift 1
fi

while read line; do
	if [[ $force == "" && $line == "" ]]; then
		echo
		continue
	fi
	printf "$1\n" "$line"
done
