#!/bin/bash
#
#

__zombit="$(ps auxww | grep 'Z' | grep -v 'grep' | grep -v USER |  awk '{ print $2 }')"

output(){
	type="${1}"
	msg="${2}"
	case $type in
		-n|-notify) printf "\033[35m${2}\033[0m\n";;
		-e|-error) printf "\033[31m${2}\033[0m\n";;
	esac
}


if [ ! -z "$__zombit" ];
then
	echo "Zombie Parent: $__zombit"
	#pstree -p -s $__zombit
else
	output -notify "No zombies found..."
fi
