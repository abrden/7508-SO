#!/bin/bash

IP=$1

# Uso de flag -E (Extended regex) para utilizar {min, max}

if ! [ -z $(echo $IP | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') ]
then
	echo "Valid IP"
else
	echo "Invalid IP"
fi
