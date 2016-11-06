#!/bin/bash

# Por stdin nos dan un padron, tenemos que ver si el alumno esta aprobado o no.
# Se aprueba con A A- A+
# El formato de la planilla de notas es UNKNOWN;PADRON;NOMBRE;UNKNOWN;NOTA
# Escribir por stdout $PADRON, aprobado o $PADRON, desaprobado

PADRON=$(grep ".*")
echo "Consulta sobre el padron $PADRON"

grep '.*;$PADRON;.*;.*;A[+|-]\?' notas.txt && echo "$PADRON esta aprobado" || echo "$PADRON esta desaprobado"
