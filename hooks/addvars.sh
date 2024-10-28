#!/bin/bash
# usage: addvars <config.ini>... <input >output

while IFS='' read -r line; do
	for config in "$@"; do
		if [ -f $config ]; then
			section=""
			while read -r arg; do
				if [[ "$arg" == "" || ${arg:0:1} == ";" ]]; then
					continue
				fi
				if [[ ${arg:0:1} == "[" ]]; then
					section="$(echo "$arg" | cut -c2- | rev | cut -c2- | rev)\\."
					continue
				fi
				name=$(echo $arg | cut -d= -f1)
				value=$(echo $arg | cut -d= -f2 | sed 's/\([\\/&]\)/\\\1/g')
				line="$(echo "$line" | sed "s/\\\${$section$name}/$value/g")"
			done <$config
		fi
	done
	echo "$line"
done
