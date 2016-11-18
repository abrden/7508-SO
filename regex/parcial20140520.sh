#!/bin/bash

CODIGO=$1

((echo $CODIGO | grep "^A$") && echo "SIN REACTOR") || ((echo $CODIGO | grep "^[B-Z]$") && echo "NORMAL") || ((echo $CODIGO | grep "^AA$") && echo "NORMAL") || ((echo $CODIGO | grep "^A[B-F]$") && echo "CALIENTE") || ((echo $CODIGO | grep "^A[G-Z]$") && echo "SOBRECALENTADO")

