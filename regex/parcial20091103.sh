#!/bin/bash

ARCHIVO="DATOS.dat"

LOCALIDAD=$1
DIA=$2

COUNT=$(grep -c "^[^;]*;[^;]*$DIA[^;]*;[^_]*_[^:]:$LOCALIDAD$" $ARCHIVO)

echo "Pueden realizar la tarea en $LOCALIDAD un $DIA: $CANTIDAD tecnicos"
