#!/bin/bash

FILE=/etc/passwd

echo "USERS"
sed 's/^\(.*\):.*:.*:.*:.*:.*:.*$/\1/g' $FILE

echo

echo "/bin/bash USERS"
grep '.*\/bin\/bash$' $FILE | sed 's/^\(.*\):.*:.*:.*:.*:.*:.*$/\1/g'
