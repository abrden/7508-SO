#!/bin/bash

EMAIL=$1

if ! [ -z $(echo $EMAIL | grep -E ^*\@*.com$) ]
then
	echo "Valid email"
else
	echo "Invalid email"
fi
