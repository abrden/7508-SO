#!/bin/bash

ERROR_CODE=$1

grep ":$ERROR_CODE:" CLASE_DE_ERRORES.dat > /dev/null && grep ":$ERROR_CODE:" CLASE_DE_ERRORES.dat | sed "s/^.*:$ERROR_CODE:\(.*\):.*:.*:.*$/<$ERROR_CODE> - \1/" || echo "<$ERROR_CODE> - No clasificado"
