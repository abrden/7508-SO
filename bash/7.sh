#!/bin/bash

while [ 1 ]
do
	if [ -f prueba.txt ]
	then
		echo "El archivo existe"
	else	
		echo "El archivo no existe"
	fi
	sleep 30
done
