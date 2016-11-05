#!/bin/bash

# Se encierra entre parentesis para guardar el caracter y hacer referencia a el luego

grep '^\(.\).\1$' enteros.txt
