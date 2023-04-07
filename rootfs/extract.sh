#!/bin/bash

cd /downloads
for i in *.rar;do
    cd /downloads
    BN="$(basename "$i" .rar)"
    if [ ! -f "$i".aria2 -a ! -d "$BN" ]; then
	if ! [ -n "$(lsof -t "$i")" ]; then
        	TMP=$(mktemp -d -p ./)
        	DIR=$TMP/"$BN"
        	mkdir -p "$DIR"
        	unrar x "$i" "$DIR/"
	        rm "$i"
	        mv "$DIR" ./
	        rm -r $TMP
	fi
    fi
done
exit
