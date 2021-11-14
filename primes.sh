#!/usr/bin/env bash

read -p "Enter the start number : " lower
read -p "Enter the end number : " upper
n=$lower
c=0
while [[ $n -le $upper ]];
do
sqrtn=$(echo "$n" | awk '{print int(sqrt($1))}')
i=2
p=0
while [[ $i -le $sqrtn ]];
do
	if [[ $n%$i -eq 0 ]];
	then
		p=1
		break
	else
		((i++))
	fi
done
if [ $p -ne 1 ];
then
	((c++))
	echo $n
fi
((n++))
done
echo "There are $c prime numbers between $lower and $upper"
