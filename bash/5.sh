#!/bin/bash

DATE=`date +%Y-%m-%d`
FILES=$@


if [ -f "$DATE.lst" ]
then
	echo "El $DATE.lst ya existe!? me voy."
	exit 1
fi

for FILE in $FILES
do
	if [ ! -d $FILE ]; then
		rm "$DATE.lst"
		echo "Me pasaste algo que no es un directorio, chau."
		exit 2
	fi
	echo $FILE >> "$DATE.lst"
done

tar -czvf "$DATE.tar.gz" $FILES
