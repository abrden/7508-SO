#!/bin/perl

$PELICULAS = "catalogos/peliculas.mae";

if ($#ARGV + 1 != 2) {
	die "Cantidad de parametros erronea\n";
}

$ID_ESPECTADOR = @ARGV[0];
$DIR_INPUT = @ARGV[1];

if (! -d $DIR_INPUT) {
	die "El segundo argumento recibido no es un directorio\n";
}

push(@ARCHIVOS_ESPECTADORES, $_) while (<$DIR_INPUT/*.dat>); 

if ($#ARCHIVOS_ESPECTADORES + 1 == 0) {
	die "No hay archivos espectadores\n";
}

if (! -f $PELICULAS) {
	die "No se encontro el archivo de peliculas en $PELICULAS\n";
}

%PELICULAS_POR_GENERO;

foreach $ESPECTADOR (@ARCHIVOS_ESPECTADORES) {
	open(FH, "<$ESPECTADOR") or die "No se pudo abrir el archivo espectador $ESPECTADOR";
	while (<FH>) {
		#Usar $_
	}

}
