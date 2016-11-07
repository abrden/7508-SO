#!/bin/bash

INPUT_DIR="$PWD/input"
RECHAZADOS="$PWD/rechazados"
ACEPTADOS="$PWD/aceptados"
SERVICIOS="$PWD/mae/segba.dat"
TARIFA_SOCIAL="$PWD/mae/tarifa_social.dat"
RESULTADOS="$PWD/resultados"

shopt -s nullglob
for FILE in "$INPUT_DIR"/*
do
	# Continuar si la fecha tiene un formaro invalido
	if [ -z $(echo $FILE | grep -E 'sol_fact_[0-2][0-9]{3}[0-1][0-9][0-3][0-9]') ]
	then
		echo "Fecha invalida ($FILE)"
		continue	
	fi

	# Continuar si la fecha es posterior a la actual
	if [ $(($(date +%Y%m%d))) -le $(($(cut $FILE -d "_" -f 3))) ]
	then
		echo "Fecha posterior ($FILE)"
		continue
	fi

	echo "Paso 1 completado: Fecha valida"

	# Para cada registro, validar que id_servicio y region existan en el archivo de servicios
	while read -r LINE
	do
		ID=$(cut $LINE -d "," -f 1)
		REGION=$(cut $LINE -d "," -f 4)
		#EXISTE=0

		#while read -r LINE_SERVICIOS # O se puede usar grep para no hacer loops, oops  
		#do
		#	SERVICIOS_ID=$(cut $LINE_SERVICIOS -d "," -f 1)
		#	SERVICIOS_REGION=$(cut $LINE_SERVICIOS -d "," -f 3)
		#	if [[ ($ID == $SERVICIOS_ID) && ($REGION == $SERVICIOS_REGION) ]]
		#	then
		#		echo "El registro tiene su id y region en el archivo de servicios"
		#		EXISTE=1
		#		break
		#	fi
		#done < $SERVICIOS

		#if [ -z $EXISTE ]
		#then
		#	echo "ID y REGION no existen en el archivo de servicios ($LINE)"
		#	# Append del registro invalido al archivo correspondiente del directorio /rechazados
		#	echo $LINE >> "$RECHAZADOS/$FILE"
		#	continue
		#else
		#	# Append del registro valido al archivo correspondiente del directorio /aceptados
		#	echo $LINE >> "$ACEPTADOS/$FILE"
		#fi

		if ! [ -z $(grep "^$ID,.*,$REGION,.*" $SERVICIOS)]
		then
			# Append del registro valido al archivo correspondiente del directorio /aceptados
			echo $LINE >> "$ACEPTADOS/$FILE"
		else
			echo "ID y REGION no existen en el archivo de servicios ($LINE)"
                	# Append del registro invalido al archivo correspondiente del directorio /rechazados
                	echo $LINE >> "$RECHAZADOS/$FILE"
                	continue
		fi

	done < $FILE

	echo "Paso 2 completado: Todos los registros tienen su id y region en el archivo de servicios"

	# Obtener como salida un archivo nueva_fact_aaaammdd 

	while read -r LINE
	do
		FECHA=$(cut $FILE -d "," -f 3)
		
		ID_SERVICIO=$(cut $LINE -d "," -f 1)
		ID_CUENTA=$(cut $LINE -d "," -f 2)
                REGION=$(cut $LINE -d "," -f 4)
		VENCIMIENTO=$(cut $LINE -d "," -f 5)
		IMPORTE=$(cut $LINE -d "," -f 3)
		PORCENTAJE=1

                #while read -r LINE_SERVICIOS
                #do
                #        SERVICIOS_ID=$(cut $LINE_SERVICIOS -d "," -f 1)
                #        SERVICIOS_REGION=$(cut $LINE_SERVICIOS -d "," -f 3)
                #        if [[ ($ID_SERVICIO == $SERVICIOS_ID) && ($REGION == $SERVICIOS_REGION) ]]
                #        then
                #                PORCENTAJE=$(cut $LINE_SERVICIOS -d "," -f 4)
		#		break
                #        fi
                #done < $SERVICIOS
		
		PORCENTAJE=$(grep "^$ID_SERVICIO,.*,$REGION,.*" $SERVICIOS | sed "s/^$ID_SERVICIO,.*,$REGION,\(.*\)/\1/")
		
		if ! [ -z $(grep "^$ID_CUENTA$" $TARIFA_SOCIAL) ]
		then
			PORCENTAJE=0
		fi

		#while read -r LINE_TARIFA_SOCIAL
		#do
		#	TARIFA_SOCIAL_ID_CUENTA=$(cut $LINE -d "," -f 2)
		#	if [[ $ID_CUENTA == $TARIFA_SOCIAL_ID_CUENTA ]]
		#	then
		#		PORCENTAJE=0
		#		break
		#	fi
		#done < $TARIFA_SOCIAL

		# Grabar nueva factura
		NUEVO_IMPORTE=$(($IMPORTE + $IMPORTE * $PORCENTAJE))
		echo "$ID_SERVICIO,$ID_CUENTA,$NUEVO_IMPORTE,$VENCIMIENTO" >> "$RESULTADOS/nueva_fact_$FECHA"

	done < "$ACEPTADOS/$FILE"
	
	echo "Paso 3 completado: Nueva factura"
done
