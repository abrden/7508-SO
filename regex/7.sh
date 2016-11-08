#!/bin/bash

# Realizar un shell script que busque dentro del archivo datos.txt los números decimales mayores  7.534

grep -E "[1-9][0-9]+\.[0-9]*|7\.[5-9][3-9][4-9][0-9]*|[8-9]\.[0-9]*" datos.txt
