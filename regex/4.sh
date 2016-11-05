#!/bin/bash

DATE=$1

if ! [ -z $(echo $DATE | grep -E '[0-9]{4}-[0-1][0-9]-[0-3][0-9]') ]
then
	echo "Valid date"
else
	echo "Invalid date"
fi
