#!/bin/perl

$DIR_RESMAS = "consumo_previsto";
$ARCHIVO_STOCK = "stock/resmas_en_stock";
$ARCHIVO_SALIDA = "salida";

if (! -f $ARCHIVO_STOCK) {
	die "No existe el archivo $ARCHIVO_STOCK\n";
}

if ($#ARGV + 1 != 2) {
        die "La cantidad de argumentos es invalida.\n";
}

$SEMANA_INICIO=$ARGV[0];
if ($SEMANA_INICIO < 1 || $SEMANA_INICIO > 52) {
	die "La semana de inicio ingresada es invalida ($SEMANA_INICIO)";
}

$SEMANA_FIN=$ARGV[1];
if ($SEMANA_FIN < 1 || $SEMANA_FIN > 52 || $SEMANA_FIN < $SEMANA_INICIO) {
        die "La semana de fin ingresada es invalida ($SEMANA_FIN)";
}


%CANTIDADES;
open($STOCK_FH, "<$ARCHIVO_STOCK") or die "No se pudo abrir el archivo $ARCHIVO_STOCK\n";
while ($LINEA=<$STOCK_FH>) {
	($TIPO, $CANTIDAD) = split(",", $LINEA);
	($TAMANIO, $GRAMAJE, $DIMENSION) = split("-", $TIPO);
	if (exists($CANTIDADES{$TAMANIO})) {
		$CANTIDADES{$TAMANIO} += $CANTIDAD;
	} else {
		$CANTIDADES{$TAMANIO} = $CANTIDAD;
	}
}
close($STOCK_FH);

$QUERY_TAMANIO="";
while (!exists($CANTIDADES{$QUERY_TAMANIO})) {
	print "Ingrese un tamanio de papel: ";
	$QUERY_TAMANIO = <STDIN>;
	if (exists($CANTIDADES{$QUERY_TAMANIO})) {
		print "La cantidad de resmas en stock de tamanio $QUERY_TAMANIO es: ".$CANTIDADES{$QUERY_TAMANIO}."\n";
	} else {
		print "El tamanio de papel consultado es inexistente\n";
	}
}

%CONSUMO; #oficina -> cantidad para el tam ingresado
foreach $ARCHIVO (readdir($DIR_RESMAS)) {
	
	($LABEL , $NRO_SEMANA) = split("_", $ARCHIVO);
	if ($NRO_SEMANA < $SEMANA_INICIO || $NRO_SEMANA > $SEMANA_FIN) {
		continue;
	}

	open ($FH, "<$ARCHIVO") or die "No se pudo abrir el archivo $ARCHIVO\n";
	while ($LINEA=<$FH>) {
		($OFICINA, $TIPO, $CANTIDAD) = split(";", $LINEA);
		($TAMANIO, $GRAMAJE) = split("-", $TIPO);
		if ($TAMANIO eq $QUERY_TAMANIO) {
			if (exists($CONSUMO{$OFICINA})) {
				$CONSUMO{$OFICINA} += $CANTIDAD;
			} else {
				$CONSUMO{$OFICINA} = $CANTIDAD;
			}
		}
	}
	close($ARCHIVO);
}

open($SALIDA_FH, ">$ARCHIVO_SALIDA") or die "No se pudo abrir el archivo de salida $ARCHIVO_SALIDA\n";
foreach $OFICINA (keys(%CONSUMO)) {
	print $SALIDA_FH "$QUERY_TAMANIO;semana $SEMANA_INICIO a $SEMANA_FIN;$OFICINA;$CONSUMO{$OFICINA}\n";
}
close($SALIDA_FH);
