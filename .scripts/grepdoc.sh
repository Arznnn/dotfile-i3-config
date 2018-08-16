#!/bin/bash
echo -e "\n
Welcome to scandocs. This will search .doc AND .docx files in this directory for a given string. \n
Type in the text string you want to find... \n"
read response
find . -name "*.doc" | 
while read i; do catdoc "$i" | 
grep --color=auto -iH --label="$i" "$response"; done
find . -name "*.docx" | 
while read i; do docx2txt < "$i" | 
grep --color=auto -iH --label="$i" "$response"; done
