#!/bin/bash

SOLICITUDES="NOV/SOL_INPUT/solicitudes_*.dat"
FECHA=$1

echo "Para la fecha: $FECHA"

grep -E "^.*;.*;.*;[0-9]{5,},[0-9]*;$FECHA;.*$" $SOLICITUDES | sed "s@^.*:\(.*\);.*;.*;.*;.*;\(.*\)\$@\1 con responsable: \2@g"

grep -E "^.*;.*;.*;[6-9][0-9]{3},[0-9]*;$FECHA;.*$" $SOLICITUDES | sed "s@^.*:\(.*\);.*;.*;.*;.*;\(.*\)\$@\1 con responsable: \2@g"

grep -E "^.*;.*;.*;5[7-9][0-9]{2},[0-9]*;$FECHA;.*$" $SOLICITUDES | sed "s@^.*:\(.*\);.*;.*;.*;.*;\(.*\)\$@\1 con responsable: \2@g"

grep -E "^.*;.*;.*;56[7-9][0-9],[0-9]*;$FECHA;.*$" $SOLICITUDES | sed "s@^.*:\(.*\);.*;.*;.*;.*;\(.*\)\$@\1 con responsable: \2@g"

grep -E "^.*;.*;.*;566[1-9],[0-9]*;$FECHA;.*$" $SOLICITUDES | sed "s@^.*:\(.*\);.*;.*;.*;.*;\(.*\)\$@\1 con responsable: \2@g"

grep -E "^.*;.*;.*;5660,99[0-9]+;$FECHA;.*$" $SOLICITUDES | sed "s@^.*:\(.*\);.*;.*;.*;.*;\(.*\)\$@\1 con responsable: \2@g"
