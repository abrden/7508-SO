#!/bin/bash

SOLICITUDES="NOV/SOL_INPUT/solicitudes_*.dat"
PRIORIDAD=$1

echo "Para la prioridad: $PRIORIDAD"

grep -E "^.*;.*;$PRIORIDAD;[0-9]{5,},[0-9]*;.*;.*$" $SOLICITUDES | sed "s/^.*:\(.*\);.*;.*;.*;\(.*\);.*$/\1 con fecha: \2/g"

grep -E "^.*;.*;$PRIORIDAD;[6-9][0-9]{3},[0-9]*;.*;.*$" $SOLICITUDES | sed "s/^.*:\(.*\);.*;.*;.*;\(.*\);.*$/\1 con fecha: \2/g"

grep -E "^.*;.*;$PRIORIDAD;5[3-9][0-9]{2},[0-9]*;.*;.*$" $SOLICITUDES | sed "s/^.*:\(.*\);.*;.*;.*;\(.*\);.*$/\1 con fecha: \2/g"

grep -E "^.*;.*;$PRIORIDAD;52[7-9][0-9],[0-9]*;.*;.*$" $SOLICITUDES | sed "s/^.*:\(.*\);.*;.*;.*;\(.*\);.*$/\1 con fecha: \2/g"

grep -E "^.*;.*;$PRIORIDAD;5269,[0-9]*;.*;.*$" $SOLICITUDES | sed "s/^.*:\(.*\);.*;.*;.*;\(.*\);.*$/\1 con fecha: \2/g"

grep -E "^.*;.*;$PRIORIDAD;5268,9[1-9][0-9]*;.*;.*$" $SOLICITUDES | sed "s/^.*:\(.*\);.*;.*;.*;\(.*\);.*$/\1 con fecha: \2/g"
