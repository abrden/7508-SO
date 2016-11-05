#!/bin/bash


function recursive_ls() {

	PARENT_DIR=$1

	shopt -s nullglob
	for FILE in "$PARENT_DIR"/*
	do
		if [ -f $FILE ]
		then
			continue
		fi
		echo "$FILE"
		if [ -d $FILE ]
		then
			recursive_ls "$FILE"
		fi
	done
}


recursive_ls $1
