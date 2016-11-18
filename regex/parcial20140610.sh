#!/bin/bash

# Mostrar los resultados de un equipo a lo largo de todo el torneo en base a la condicion de LOCAL

ARCHIVO="Match.Master"
PARTIDOS="Country.List"

PAIS=$1
CONDICION=$2

ID_PAIS=$(grep "$PAIS" $PAISES | sed "s@^\(.*\),.*,.*@\1@")

(echo $CONDICION | grep "LOCAL") && (grep "^.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;\([0-9]{2}\)\([0-9]{2}\)[0-9]{2};.*;W.*$ID_PAIS;@GANO el \1 \2 a \3@g")
(echo $CONDICION | grep "LOCAL") && (grep "^.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;\([0-9]{2}\)\([0-9]{2}\)[0-9]{2};.*;L.*$ID_PAIS;@PERDIO el \1 \2 a \3@g")
(echo $CONDICION | grep "LOCAL") && (grep "^.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;\([0-9]{2}\)\([0-9]{2}\)[0-9]{2};.*;T.*$ID_PAIS;@EMPATO el \1 \2 a \3@g")
(echo $CONDICION | grep "LOCAL") && (grep "^.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;\([0-9]{2}\)\([0-9]{2}\)\([0-9]\)\([0-9]\);.*;WP.*$ID_PAIS;@GANO PENALES el \1 \2 a \3 (\4 a \5)@g")
(echo $CONDICION | grep "LOCAL") && (grep "^.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;\([0-9]{2}\)\([0-9]{2}\)\([0-9]\)\([0-9]\);.*;LP.*$ID_PAIS;@PERDIO PENALES el \1 \2 a \3 (\4 a \5)@g")

(echo $CONDICION | grep "VISITANTE") && (grep "^.*;.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;.*;\([0-9]{2}\)\([0-9]{2}\)[0-9]{2};W.*$ID_PAIS;@GANO el \1 \2 a \3@g")
(echo $CONDICION | grep "VISITANTE") && (grep "^.*;.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;.*;\([0-9]{2}\)\([0-9]{2}\)[0-9]{2};L.*$ID_PAIS;@PERDIO el \1 \2 a \3@g")
(echo $CONDICION | grep "VISITANTE") && (grep "^.*;.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;.*;\([0-9]{2}\)\([0-9]{2}\)[0-9]{2};T.*$ID_PAIS;@EMPATO el \1 \2 a \3@g")
(echo $CONDICION | grep "VISITANTE") && (grep "^.*;.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;.*;\([0-9]{2}\)\([0-9]{2}\)\([0-9]\)\([0-9]\);WP.*$ID_PAIS;@GANO PENALES el \1 \2 a \3 (\4 a \5)@g")
(echo $CONDICION | grep "VISITANTE") && (grep "^.*;.*;.*;$ID_PAIS;" $PARTIDOS | sed "s@^.*;\(.*\);.*;.*;.*;\([0-9]{2}\)\([0-9]{2}\)\([0-9]\)\([0-9]\);LP.*$ID_PAIS;@PERDIO PENALES el \1 \2 a \3 (\4 a \5)@g")
