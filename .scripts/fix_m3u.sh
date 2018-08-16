#!/bin/bash

[ -z "$1" ] && echo "Usage: $(basename $0) <path>" && exit 1
[ ! -d $1 ] && echo "Error: $1 is not a valid path" && exit 1

IFS=$'\n'
for i in $(find $1 -name *.m3u); do
    DIR=$(dirname $i)
    FILE=$(basename $i)
    echo -e "Dir: $DIR \t m3u File: $FILE"
    for line in $(cat $i); do
        mp3=$(basename $line)
        echo "$mp3" >>/tmp/new.m3u
    done
    mv -f /tmp/new.m3u $i
    echo "New $FILE created"
done

# ./fix_m3u.sh /mnt/irgendein-album/