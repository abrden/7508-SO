#!/bin/bash


for I in `seq 0 10`
do
	echo "$1x$I=$(($1*$I))"
done
