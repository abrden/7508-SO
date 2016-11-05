#!/bin/bash

DIR=$1
DATE=`date +%Y-%m-%d`

tar -cvzf "$DATE-$DIR.tgz" $DIR
