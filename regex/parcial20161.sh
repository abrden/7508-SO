#!/bin/bash

# Determinar el precio de lista bruto de todos los productos de la localidad que se encuentre dentro de los datos de sesion de cada navegante del sitio web de todo el pais

DATOS_SESION=$1

LOCALIDAD=$(echo $1 | sed -e "s/^.*|.*|.*|\(.*\)/\1/")

ID_LISTA=$(grep $LOCALIDAD ListasDePrecios.dat | sed -e "s/^\(.*\),.*,.*,.*,.*$/\1/")

echo "Lista de precios: $ID_LISTA"

sed -e "s/^\(.*\),.*,\(.*\),.*,.*$/\1+\2/" $ID_LISTA
