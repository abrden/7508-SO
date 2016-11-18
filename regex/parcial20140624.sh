#!/bin/bash

DNI=$(grep ".*")
ARCHIVO="Cuentas.Master"

# Obtener saldos de juicios activos para DNI mostrando: EXPEDIENTE SUCURSAL CUENTA SALDO

grep "^.*;.*;$DNI;.*;A" $ARCHIVO | sed "s@^\(.*\);.*;.*;.*;.*;\(.*\)/\(.*\);\(.*\)@\1 \2 \3 \4@g"
