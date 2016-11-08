#!/bin/perl

open (HANDLER,"<facturas.txt") || die "ERROR: No puedo abrir el fichero facturas.txt\n";

%sucursales;

while ($linea=<HANDLER>) {
	@registro = split(",", $linea);
	$sucursal = $registro[2];
	if (exists($sucursales{$sucursal})) {
		$sucursales{$sucursal} = $sucursales{$sucursal} + 1;
	} else {
		$sucursales{$sucursal} = 1;
	}
}

close(HANDLER);

foreach $key (keys(%sucursales)) {
	print "La sucursal ".$key." tiene ".($sucursales{$key})." facturas\n";
}
