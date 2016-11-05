#!/bin/bash

ANSWER=0

while [ $ANSWER -ne $$ ]
do
	echo "Guess my PID!"
	read ANSWER
	if [ $ANSWER -eq $$ ]; then
		echo "Good job! That's my PID!"
	elif [ $ANSWER -lt $$ ]; then
		echo "Wrong! my PID is higher"
	elif [ $ANSWER -gt $$ ]; then
 		echo "Wrong! my PID is lower"
	fi
done
