#|/bin/bash

while read -r LINE
do
	if ! [ -z $(echo $LINE | grep -E '^4[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}') ]
	then
		echo "$LINE:VISA"
	elif ! [ -z $(echo $LINE | grep -E '^5[1-5][0-9]{2}-[0-9]{4}-[0-9]{4}-[0-9]{4}') ]
	then
		echo "$LINE:MASTERCARD"
	elif ! [ -z $(echo $LINE | grep -E '^3[4-7][0-9]-[0-9]{4}-[0-9]{4}-[0-9]{4}') ]
	then
		echo "$LINE:AMERICAN"
	else
		echo "$LINE:UNKNOWN"
	fi
done < "debito-automatico.txt"
