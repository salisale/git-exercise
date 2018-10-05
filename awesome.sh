#!/bin/bash

# This script lists files in a given directory whose size is larger than K bytes
# It does not include files in subdirectory

if [ "$#" -ne 2 ]; then
	if [ "$1" == "--help" ]; then
		echo "$0 list files in a given directory whose size is larger than K bytes"
		echo "Usage: $0 {dir path} {K}"
	else
		echo "This method accepts two arguments. Print --help for info."
	fi
elif [ ! -d "$1" ]; then
	echo "Not valid directory, sorry"
else
	cd "$1"
	for filee in `find . -type f -maxdepth 1`; do
		fsize=$(wc -c <"$filee")
		if [ "$fsize" -gt "$2" ]; then
			printf "$fsize: $filee\n"
		fi
	done
fi

# This script does not check whether K is a number
# It should.