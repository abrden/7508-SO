#!/bin/perl

$PELICULAS = "catalogos/peliculas.mae";
$DIR_OUTPUT = "output";

if ($#ARGV + 1 != 2) {
	die "Cantidad de parametros erronea\n";
}

$ID_ESPECTADOR_RECIBIDO = @ARGV[0];
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

%GENEROS;
open($FH_PELIS, "<$PELICULAS");
while ($LINEA=<$FH_PELIS>) {
	chomp $LINEA;
	@PELICULA = split(",", $LINEA);
	$ID_PELICULA = $PELICULA[0];
	$GENERO = substr($PELICULA[6], 0, 8);
	$GENEROS{$ID_PELICULA} = $GENERO;
}
close($FH_PELIS);

%PELICULAS_POR_GENERO;
foreach $ESPECTADOR (@ARCHIVOS_ESPECTADORES) {
	open($FH, "<$ESPECTADOR") or die "No se pudo abrir el archivo espectador $ESPECTADOR";
	while ($LINEA=<$FH>) {
		chomp $LINEA;
		($SALA,$ID_ESPECTADOR,$ID_PELICULA,$FUNCION,$FECHA,$CANT_ENTRADAS) = split(":",$LINEA);
		if ($ID_ESPECTADOR == $ID_ESPECTADOR_RECIBIDO) {
			if (exists($GENEROS{$ID_PELICULA})) {
				$GENERO = $GENEROS{$ID_PELICULA};
			} else {
				$GENERO = "indeterminado";
			}

			if (exists($PELICULAS_POR_GENERO{$GENERO})) {
				$PELICULAS_POR_GENERO{$GENERO}++;
			} else {
				$PELICULAS_POR_GENERO{$GENERO} = 1;
			}
		}
	}
	close($FH);
}

foreach $GENERO (keys(%PELICULAS_POR_GENERO)) {
	print "Genero: ".$GENERO." - Cantidad de peliculas: ".$PELICULAS_POR_GENERO{$GENERO}."\n";
}

print "Desea guardar este resultado en un archivo? (si/no)\n";

$RESPUESTA = <STDIN>;
chomp $RESPUESTA;
$RESPUESTA = lc($RESPUESTA);

if ($RESPUESTA == "si") {
	open($FH_SALIDA, ">$DIR_OUTPUT/$ID_ESPECTADOR_RECIBIDO.txt");
	foreach $GENERO (keys(%PELICULAS_POR_GENERO)) {
	        print $FH_SALIDA "Genero: ".$GENERO." - Cantidad de peliculas: ".$PELICULAS_POR_GENERO{$GENERO}."\n";
	}
	close($FH_SALIDA);
}
