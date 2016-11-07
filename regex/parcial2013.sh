#!/bin/bash

PARAMS=$(grep ".*")
COD_LOCALIDAD=$(echo $PARAMS | sed 's#^\(.*\) .*#\1#')
NRO_ORDEN=$(echo $PARAMS | sed 's#.* \(.*\)#\1#')

# Obligatory " en grep y sed para que reemplace las variables en la regex

grep -E "^$COD_LOCALIDAD:.*:.*:.*:$NRO_ORDEN:.*" Eleccion.Result | sed "s@^$COD_LOCALIDAD:.*:.*:.*:$NRO_ORDEN:\(.*\):.*:\(.*\)@\2-\1@"
