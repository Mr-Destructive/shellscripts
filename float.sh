#!/usr/bin/env bash

read -p "Enter the number : " n

if [[ $n =~ ^[+-]?[0-9]+$ ]];then
	echo "The Input is an integer."
elif [[ $n =~ ^[+-]?[0-9]*\.?[0-9]+$ ]];then
	echo "Input is a float "
else
	echo "The input is not a number."
fi
