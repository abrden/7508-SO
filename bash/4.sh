#!/bin/bash

if [ -z $1 ]
then
	echo "Pasame un nro por parametro y te digo si es divisible por 101 ;)"
else
	if [ $(($1%101)) -eq 0 ]
	then
		echo "Es divisible! ($1)"
	else
		echo "No es divisible ($1)"
	fi
fi
