#!/bin/bash


for FILE in $PWD/arribos/*; do
	while read -r LINE; do
		nro_factura=$(cut -d "," -f 1 $LINE)
		id_modem=$(cut -d "," -f 2 $LINE)
		fecha=$(cut -d "," -f 3 $LINE)
		cantidad=$(cut -d "," -f 4 $LINE)
		if [ $cantidad -gt 10 ]; then
			echo "$LINE"
			continue
		fi
		info_modem=$(grep -E "^$id_modem" /mae/MODEMS.dat)
		importe=$(cut -d "," -f 5 $info_modem)
		id_gama=$(cut -d "," -f 4 $info_modem)
		if [ -z $importe -o -z $id_gama ]; then
			echo "$LINE" >> /errores/errores.txt
			continue
		fi
		descuento=$(grep -E "^$id_gama"  /mae/GAMA.dat | cut -d "," -f 3)
		importe_total=$(echo "scale=2; $importe*$descuento*$cantidad" | bc)
		echo "$nro_factura|$id_modem|$fecha|$importe_total" >> /resultados/facturas.txt
	done < $FILE
done
