#!/bin/bash

DNI=$(grep ".*")

grep "^.*;.*;$DNI;.*;.*;.*;.*$" Cuentas.Master | sed "s/^\(.*\);.*;.*;.*;.*;\(.*\)\/\(.*\);\(.*\)$/\1 \2 \3 \4/"
