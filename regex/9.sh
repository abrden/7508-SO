#!/bin/bash

# Dado una duración de canción pasada por parámetro con el siguien
# te formato (hh:mm:ss) indicar si es mayor o menor al límite establecido:
LIMITE="00:03:12"

DURACION=$1

echo $DURACION | grep -E "00:03:[1-9][3-9]|00:0[4-9]:[0-9][0-9]|[1-9][0-9]:[0-9][0-9]:[0-9][0-9]|0[1-9]:[0-9][0-9]:[0-9][0-9]|00:[1-9][0-9]:[0-9][0-9]" && echo "Es mayor al limite" || echo "Es menor al limite"

