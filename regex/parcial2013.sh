#!/bin/bash

PARAMS=$(grep ".*")
COD_LOCALIDAD=$(echo $PARAMS | sed 's#^\(.*\) .*#\1#')
NRO_ORDEN=$(echo $PARAMS | sed 's#.* \(.*\)#\1#')

echo $COD_LOCALIDAD
echo $NRO_ORDEN

filt=$(grep -E "^$COD_LOCALIDAD:.*:.*:.*:$NRO_ORDEN:.*" Eleccion.Result)
echo "$filt"
res=$(echo $filt | sed 's#^$COD_LOCALIDAD:.*:.*:.*:$NRO_ORDEN:\(.*\):.*:\(.*\)#\2-\1#')
echo $res
