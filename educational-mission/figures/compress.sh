#!/usr/bin/env bash

[ $# -ne 1 ] && {
	echo "usage: $0 [IMAGE]"
	exit 1
}

mogrify -quality 30% "${1}"
exit 0
