#!/bin/perl

@A;
@B;
@C;

for ($i = 0; $i < 45; $i++) {
	$A[$i] = $i + 1;
	$B[$i] = $i + 1;

	$C[$i] = $A[$i] + $B[$i];
}

for ($i = 0; $i <= $#C; $i++) {
	print $C[$i] . "\n";
}
