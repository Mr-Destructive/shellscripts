#!/usr/bin/env bash

read -p "Enter the word to find meaning : " word
output="meaning.txt"
url="https://www.dictionary.com/browse/$word"

curl -o $output $url 
clear
grep -o '(?<=<span class="one-click-content css-nnyc96 e1q3nk1v1">).*?(?=</span>)' $output >temp.txt 
sed -i 's/<[^>]*>//g' temp.txt >$output
grep -v '^\s*$\|^\s*\#' temp.txt >$output
echo "$word"
while read meaning 
do
	echo $meaning
done < $output
